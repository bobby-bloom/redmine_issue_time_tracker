import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ritt/app/providers/settings.dart';
import 'package:ritt/app/ui/dialogs/async_value_dialog.dart';
import 'package:ritt/app/ui/dialogs/request_dialog.dart';
import 'package:ritt/app/utils/duration_utils.dart';
import 'package:ritt/redmine/models/redmine_thing.dart';
import 'package:ritt/redmine/models/time_entry.dart';
import 'package:ritt/redmine/providers/redmine_service.dart';
import 'package:ritt/redmine/providers/redmine_time_entry_activities.dart';
import 'package:ritt/redmine/providers/redmine_user.dart';
import 'package:ritt/app/providers/timers.dart';
import 'package:ritt/app/theme/theme_extensions.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart' as shadcn;

import '../../models/timer.dart';

class PostTimeDialog extends HookConsumerWidget {
  const PostTimeDialog({super.key, required this.timer});

  final Timer timer;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userIdFormKey = shadcn.InputKey('user-id');
    final issueIdFormKey = shadcn.InputKey('issue-id');
    final projectIdFormKey = shadcn.InputKey('project-id');
    final activityFormKey = shadcn.FormKey<RedmineThing>('activity');
    final commentsFormKey = shadcn.InputKey('comments');

    final user = ref.watch(redmineUserProvider).value;
    ref.watch(timersProvider);
    ref.watch(redmineServiceProvider);

    final projectId = useState(timer.issue?.project.id.toString());
    final tTimer = useState(timer);
    final settings = ref.watch(settingsProvider);
    final trackerName = timer.issue?.tracker?.name;

    final isBillable = useState(
      settings.billableTrackers.contains(trackerName),
    );
    final hoursCtl = useRef(
      shadcn.ComponentValueController<Duration>(
        DurationUtils.roundUpToMinuteInterval(
          tTimer.value.totalTime,
          settings.roundTimeEntryUpToMinute,
        ),
      ),
    );

    final activity = useState<RedmineThing?>(null);

    ref.listen(
      timeEntryActitiviesProvider(int.tryParse(projectId.value ?? '') ?? 0),
      (_, state) => state.showError(context),
    );

    useEffect(() {
      if (!tTimer.value.isRunning) {
        return null;
      }

      WidgetsBinding.instance.addPostFrameCallback((_) {
        tTimer.value = ref.read(timersProvider.notifier).toggle(timer);

        hoursCtl.value.value = DurationUtils.roundUpToMinuteInterval(
          tTimer.value.totalTime,
          settings.roundTimeEntryUpToMinute,
        );
      });

      return null;
    }, []);

    Future<void> handleSubmit(Map<shadcn.FormKey, dynamic> form) async {
      if (!context.mounted) {
        return;
      }

      final service = ref.read(redmineServiceProvider);

      TimeEntryResponse? response;
      try {
        response = await service.postTimeEntry(
          userId: int.parse(form[userIdFormKey]),
          projectId: int.parse(form[projectIdFormKey]),
          issueId: int.parse(form[issueIdFormKey]),
          activityId: (form[activityFormKey] as RedmineThing).id,
          comments: form[commentsFormKey],
          hours: hoursCtl.value.value,
          spentOn: .now(),
        );
      } catch (error) {
        // ignore: use_build_context_synchronously
        RequestDialog.showFailed(context, error);
      }

      if (response == null) {
        return;
      }

      RequestDialog.showSuccess(
        // ignore: use_build_context_synchronously
        context,
        'Time entry successfully posted',
        then: () {
          // ignore: use_build_context_synchronously
          Navigator.of(context).pop();

          if (settings.deleteTimerAfterTimeEntryPosted) {
            ref.read(timersProvider.notifier).remove(timer.id);
          }
        },
      );
    }

    return Dialog(
      backgroundColor: context.colorScheme.surfaceContainerLowest,
      clipBehavior: .hardEdge,
      child: SingleChildScrollView(
        child: Container(
          padding: context.paddingXL.copyWith(top: 24, bottom: 12),
          constraints: BoxConstraints(maxWidth: 530),
          child: IntrinsicHeight(
            child: shadcn.Form(
              onSubmit: (_, form) => handleSubmit(form),
              child: Column(
                spacing: context.paddingMD.bottom,
                children: [
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Flexible(
                        fit: .loose,
                        child: Column(
                          mainAxisSize: .min,
                          crossAxisAlignment: .start,
                          children: [
                            Text(
                              timer.issue?.subject ?? 'Issue not found',
                              softWrap: true,
                              style: context.textTheme.headlineSmall,
                            ),
                            Text(
                              timer.issue?.project.name ?? '',
                              softWrap: true,
                            ),
                          ],
                        ),
                      ),
                      IconButton.filled(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(
                          Icons.close,
                          color: context.colorScheme.onSecondary,
                        ),
                      ),
                    ],
                  ),
                  shadcn.FormField(
                    key: userIdFormKey,
                    label: shadcn.Text('User id'),
                    validator: shadcn.NotEmptyValidator(),
                    child: shadcn.TextField(initialValue: user?.id.toString()),
                  ),
                  shadcn.FormField(
                    key: projectIdFormKey,
                    label: shadcn.Text('Project id'),
                    validator: shadcn.NotEmptyValidator(),
                    child: shadcn.TextField(
                      initialValue: projectId.value,
                      onChanged: (value) => projectId.value = value,
                    ),
                  ),
                  shadcn.FormField(
                    key: issueIdFormKey,
                    label: shadcn.Text('Issue id'),
                    child: shadcn.TextField(
                      initialValue: timer.issueId?.toString(),
                    ),
                  ),
                  shadcn.FormField(
                    key: activityFormKey,
                    validator: shadcn.NonNullValidator(),
                    label: SizedBox(height: 0, width: 0),
                    child: Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        shadcn.Text('Activity'),
                        SelectRedmineActivity(
                          inputKey: activityFormKey,
                          onChange: (x) => activity.value = x,
                          initialValue: activity.value,
                          projectId: projectId.value == null
                              ? null
                              : int.tryParse(projectId.value!),
                        ),
                      ],
                    ),
                  ),
                  shadcn.FormField(
                    key: commentsFormKey,
                    label: shadcn.Text('Comment'),
                    validator: shadcn.LengthValidator(min: 1, max: 255),
                    child: shadcn.TextField(),
                  ),
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      shadcn.Text('Time spent'),
                      shadcn.DurationInput(
                        initialValue: hoursCtl.value.value,
                        controller: hoursCtl.value,
                        onChanged: (duration) => duration == null
                            ? null
                            : hoursCtl.value.value = duration,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text('Billable'),
                      Switch(
                        value: isBillable.value,
                        onChanged: (value) => isBillable.value = value,
                      ),
                    ],
                  ),
                  const shadcn.SubmitButton(child: shadcn.Text('Post')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SelectRedmineActivity extends ConsumerWidget {
  const SelectRedmineActivity({
    super.key,
    this.inputKey,
    this.projectId,
    this.initialValue,
    this.onChange,
    this.selectionRequired = true,
  });

  final shadcn.SelectKey? inputKey;

  final int? projectId;

  final RedmineThing? initialValue;

  final void Function(RedmineThing activity)? onChange;

  final bool selectionRequired;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 260,
      child: shadcn.Select<RedmineThing>(
        key: inputKey,
        value: initialValue,
        onChanged: (value) {
          if (selectionRequired && value == null) {
            return;
          }
          onChange?.call(value!);
        },
        itemBuilder: (context, item) {
          return shadcn.Text(item.name);
        },
        popup: (context) => shadcn.SelectPopup<RedmineThing>.builder(
          key: inputKey,
          canUnselect: !selectionRequired,
          enableSearch: false,
          loadingBuilder: (context) =>
              const Center(child: CircularProgressIndicator()),
          builder: (context, searchQuery) async => builder(context, ref),
        ),
      ),
    );
  }

  Future<shadcn.SelectItemBuilder> builder(
    BuildContext context,
    WidgetRef ref,
  ) async {
    if (projectId == null || !context.mounted) {
      return shadcn.SelectItemBuilder(
        childCount: 0,
        builder: (context, idx) => shadcn.SelectItemButton(
          value: null,
          child: shadcn.Text('Project id not set'),
        ),
      );
    }

    final activities = await ref.read(
      timeEntryActitiviesProvider(projectId!).future,
    );

    return shadcn.SelectItemBuilder(
      childCount: activities.length,
      builder: (context, index) => shadcn.SelectItemButton(
        value: activities[index],
        child: shadcn.Text(activities[index].name),
      ),
    );
  }
}
