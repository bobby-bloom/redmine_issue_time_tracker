import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_reorderable_grid_view/widgets/reorderable_builder.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ritt/app/models/timer.dart';
import 'package:ritt/app/ui/dialogs/timer_form_dialog.dart';
import 'package:ritt/app/ui/pages/timer_widget.dart';
import 'package:ritt/app/providers/timers.dart';
import 'package:ritt/app/theme/theme_extensions.dart';

class TimersPage extends HookConsumerWidget {
  const TimersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timers = ref.watch(timersProvider);

    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: timers.isEmpty ? NoTimersPlaceholder() : TimersGrid(),
        ),

        Positioned(
          bottom: context.paddingXXL.left,
          right: context.paddingXXL.left,
          child: Row(
            children: [
              FloatingActionButton(
                tooltip: 'Remove all timers',
                onPressed: () => ref.read(timersProvider.notifier).removeAll(),
                child: Icon(Icons.delete_forever),
              ),
              context.gapMD,
              FloatingActionButton(
                tooltip: 'Create a new timer',
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) => TimerFormDialog(
                    onSubmit: (issueId, subject) async {
                      final timersCtl = ref.read(timersProvider.notifier);

                      await timersCtl.create(
                        issueId: issueId,
                        subject: subject,
                      );
                    },
                  ),
                ),
                child: Icon(Icons.add),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class NoTimersPlaceholder extends StatelessWidget {
  const NoTimersPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.timer_outlined,
            size: 64,
            color: Theme.of(
              context,
            ).colorScheme.onSurfaceVariant.withOpacity(0.5),
          ),
          const SizedBox(height: 16),
          Text(
            'No timers yet',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Tap + to create your first timer',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(
                context,
              ).colorScheme.onSurfaceVariant.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}

class TimersGrid extends HookConsumerWidget {
  const TimersGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timers = ref.watch(timersProvider);
    final scrollController = useScrollController();
    final gridKey = useRef(GlobalKey());

    final children = List<Widget>.generate(timers.length, (index) {
      final timer = timers[index];
      return TimerWidget(
        key: ValueKey(timer.id),
        timer: timer,
        onDelete: () => ref.read(timersProvider.notifier).remove(timer.id),
        onEdit: (issueId, subject) => ref
            .read(timersProvider.notifier)
            .update(timer.id, issueId: issueId, subject: subject),
        onRefreshIssue: (timer) =>
            ref.read(timersProvider.notifier).fetchIssue(timer.id),
      );
    });

    return LayoutBuilder(
      builder: (context, constraints) {
        final availableWidth = constraints.maxWidth;

        int crossAxisCount;
        if (availableWidth <= 999) {
          crossAxisCount = 1;
        } else {
          crossAxisCount = (availableWidth / 500).floor();
        }

        return ReorderableBuilder(
          key: gridKey.value,
          scrollController: scrollController,
          onReorder: (ReorderedListFunction reorderFunction) {
            final current = timers.toList();

            final reordered = reorderFunction(current) as List<Timer>;
            ref.read(timersProvider.notifier).set(reordered);
          },
          builder: (reorderableChildren) {
            return MasonryGridView.count(
              controller: scrollController,
              crossAxisCount: crossAxisCount,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              itemCount: reorderableChildren.length,
              padding: context.paddingXL.copyWith(
                bottom: context.paddingXL.bottom * 3,
              ),
              itemBuilder: (context, index) {
                return reorderableChildren[index];
              },
            );
          },
          children: children,
        );
      },
    );
  }
}
