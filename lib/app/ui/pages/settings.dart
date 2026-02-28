import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart'
    show
        BoxConstraints,
        BuildContext,
        Column,
        Container,
        Flexible,
        IconButton,
        Icons,
        Row,
        SizedBox,
        Widget;
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ritt/app/providers/settings.dart';
import 'package:ritt/app/theme/theme_extensions.dart';
import 'package:ritt/app/ui/dialogs/async_value_dialog.dart';
import 'package:ritt/redmine/models/redmine_issue_status.dart';
import 'package:ritt/redmine/providers/redmine_user.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart' as shadcn;
import 'package:shadcn_flutter/shadcn_flutter_experimental.dart' as shadcn_exp;

class SettingsPage extends HookConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);

    final apiKeyFormKey = shadcn.InputKey('apiKey');
    final hostFormKey = shadcn.InputKey('host');

    final runMultipleTimersSimultaneously = useState(
      settings.runMultipleTimersSimultaneously,
    );
    final fetchOnlyMyIssues = useState(settings.fetchOnlyIssuesAssignedToMe);

    final roundTimeEntryUpToMinute = useState(
      settings.roundTimeEntryUpToMinute,
    );
    final roundTimeEntryUpToMinuteCtl = useTextEditingController(
      text: settings.roundTimeEntryUpToMinute.toString(),
    );

    final billableTrackers = useState(settings.billableTrackers);
    final billableTrackersCtl = useRef(
      shadcn.ChipEditingController<String>(
        initialChips: settings.billableTrackers,
      ),
    );

    final fetchIssuesStatus = useState(settings.fetchIssuesStatus);

    final deleteTimerAfterTimeEntryPosted = useState(
      settings.deleteTimerAfterTimeEntryPosted,
    );

    ref.listen(redmineUserProvider, (_, state) => state.showError(context));

    useEffect(() {
      roundTimeEntryUpToMinuteCtl.text = roundTimeEntryUpToMinute.value
          .toString();
      return null;
    }, [roundTimeEntryUpToMinute.value]);

    useEffect(() {
      billableTrackersCtl.value.chips = billableTrackers.value;

      return null;
    }, [billableTrackers.value]);

    return Container(
      padding: context.paddingXL.copyWith(top: 0),
      child: shadcn.Form(
        onSubmit: (_, form) => handleSubmit(
          ref,
          form[apiKeyFormKey],
          form[hostFormKey],
          runMultipleTimersSimultaneously.value,
          fetchOnlyMyIssues.value,
          roundTimeEntryUpToMinute.value,
          billableTrackers.value,
          fetchIssuesStatus.value,
          deleteTimerAfterTimeEntryPosted.value,
        ),
        child: Column(
          spacing: context.paddingXL.left,
          mainAxisSize: .min,
          children: [
            shadcn.FormField(
              key: hostFormKey,
              label: shadcn.Text('Redmine Host'),
              child: shadcn.TextField(
                placeholder: const shadcn.Text('example.com'),
                initialValue: settings.redmineHost,
              ),
            ),
            shadcn.FormField(
              key: apiKeyFormKey,
              label: shadcn.Text('Redmine API Key'),
              child: shadcn.TextField(
                placeholder: const shadcn.Text('ebc3f6b781a6f...'),
                initialValue: settings.redmineApiKey,
              ),
            ),
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                shadcn.Text('Status for retrieving issues'),
                SizedBox(
                  width: 200,
                  child: shadcn.Select<RedmineIssueStatus>(
                    value: fetchIssuesStatus.value,
                    canUnselect: false,
                    onChanged: (value) {
                      if (value == null) {
                        return;
                      }
                      fetchIssuesStatus.value = value;
                    },
                    itemBuilder: (context, item) {
                      return shadcn.Text(item.name);
                    },
                    popup: (context) => shadcn.SelectPopup(
                      items: shadcn.SelectItemList(
                        children: RedmineIssueStatus.values.map((val) {
                          return shadcn.SelectItemButton(
                            value: val,
                            child: shadcn.Text(val.name),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                shadcn.Text('Fetch only issues assigned to me'),
                shadcn.Switch(
                  value: fetchOnlyMyIssues.value,
                  onChanged: (value) => fetchOnlyMyIssues.value = value,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                shadcn.Text('Delete timer after posting time entry'),
                shadcn.Switch(
                  value: deleteTimerAfterTimeEntryPosted.value,
                  onChanged: (value) =>
                      deleteTimerAfterTimeEntryPosted.value = value,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                shadcn.Text('Run multiple timers simultaneously'),
                shadcn.Switch(
                  value: runMultipleTimersSimultaneously.value,
                  onChanged: (value) {
                    runMultipleTimersSimultaneously.value = value;
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                shadcn.Text('Rounding interval for time spent in minutes'),
                SizedBox(
                  width: 115,
                  height: 36,
                  child: shadcn_exp.TextField(
                    initialValue: (settings.roundTimeEntryUpToMinute)
                        .toString(),
                    controller: roundTimeEntryUpToMinuteCtl,
                    onChanged: (value) {
                      final intVal = int.tryParse(value);
                      if (intVal == null) {
                        return;
                      }

                      final clamped = intVal.clamp(0, 60);
                      if (clamped != intVal) {
                        roundTimeEntryUpToMinuteCtl.text = clamped.toString();
                        roundTimeEntryUpToMinuteCtl.selection = .collapsed(
                          offset: roundTimeEntryUpToMinuteCtl.text.length,
                        );
                      }

                      roundTimeEntryUpToMinute.value = clamped;
                    },
                    features: [
                      .decrementButton(step: -5, position: .leading),
                      .incrementButton(step: 5),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Flexible(
                  child: shadcn.Text(
                    'Set time entry to billable if the name of the tracker is equal to',
                  ),
                ),
                context.gapLG,
                Flexible(
                  child: shadcn.ChipInput<String>(
                    controller: billableTrackersCtl.value,
                    chipBuilder: (context, chip) {
                      return shadcn.Text(chip);
                    },
                    onChipSubmitted: (value) {
                      billableTrackers.value = [
                        ...billableTrackers.value,
                        value,
                      ];
                      return value;
                    },
                  ),
                ),
              ],
            ),
            shadcn.SubmitButton(child: const shadcn.Text('Update')),
          ],
        ),
      ),
    );
  }

  void handleSubmit(
    WidgetRef ref,
    String? apiKey,
    String? host,
    bool runMultipleTimersSimultaneously,
    bool fetchOnlyMyIssues,
    int roundTimeEntryUpToMinute,
    List<String> billableTrackers,
    RedmineIssueStatus fetchIssuesStatus,
    bool deleteTimerAfterTimeEntryPosted,
  ) async {
    final ctl = ref.read(settingsProvider.notifier);

    return ctl.setState(
      (state) => state.copyWith(
        redmineApiKey: apiKey,
        redmineHost: host,
        runMultipleTimersSimultaneously: runMultipleTimersSimultaneously,
        fetchOnlyIssuesAssignedToMe: fetchOnlyMyIssues,
        roundTimeEntryUpToMinute: roundTimeEntryUpToMinute,
        billableTrackers: billableTrackers,
        fetchIssuesStatus: fetchIssuesStatus,
        deleteTimerAfterTimeEntryPosted: deleteTimerAfterTimeEntryPosted,
      ),
    );
  }
}

class UserCard extends ConsumerWidget {
  const UserCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(redmineUserProvider).value;

    Widget wrapper(Widget child) {
      const wrapperContrains = BoxConstraints(
        minWidth: double.infinity,
        minHeight: 80,
      );

      return Container(
        constraints: wrapperContrains,
        padding: context.paddingMD.copyWith(top: 0, bottom: 0),
        decoration: BoxDecoration(
          borderRadius: context.radiusSM,
          color: context.colorScheme.surfaceContainerHighest,
        ),
        child: child,
      );
    }

    final refreshButton = IconButton(
      icon: Icon(Icons.refresh_outlined),
      onPressed: () => ref.invalidate(redmineUserProvider),
    );

    if (user == null) {
      return wrapper(
        Row(children: [Text('No user'), context.gapSM, refreshButton]),
      );
    }

    return wrapper(
      Row(
        crossAxisAlignment: .center,
        children: [
          if (user.avatarUrl != null) ...[
            Container(
              height: 50,
              decoration: BoxDecoration(borderRadius: context.radiusSM),
              clipBehavior: .hardEdge,
              child: CachedNetworkImage(
                fit: .contain,
                imageUrl: user.avatarUrl!,
              ),
            ),
            context.gapMD,
          ],
          Expanded(
            child: Column(
              mainAxisAlignment: .center,
              children: [
                shadcn.Text(
                  '${user.firstName} ${user.lastName}',
                  style: context.textTheme.titleLarge,
                ),
                if (user.mail != null) ...[
                  context.gapSM,
                  Text(user.mail ?? ''),
                ],
              ],
            ),
          ),
          refreshButton,
        ],
      ),
    );
  }
}
