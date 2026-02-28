import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ritt/app/providers/settings.dart';
import 'package:ritt/app/theme/theme_extensions.dart';
import 'package:ritt/app/ui/dialogs/post_time_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/timer.dart';
import '../providers/timers.dart';
import '../ui/dialog/timer_form_dialog.dart';

class TimerWidget extends ConsumerWidget {
  const TimerWidget({
    super.key,
    required this.timer,
    this.onDelete,
    this.onEdit,
    this.onRefreshIssue,
  });

  final Timer timer;

  final VoidCallback? onDelete;

  final OnTimerFormDialogSubmit? onEdit;

  final void Function(Timer timer)? onRefreshIssue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      constraints: BoxConstraints(maxHeight: 182),
      child: Card(
        margin: const EdgeInsets.only(bottom: 16),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: context.radiusMD,
          side: timer.isRunning
              ? BorderSide(
                  color: context.colorScheme.primary.withAlpha(125),
                  width: 2,
                )
              : BorderSide.none,
        ),
        child: Padding(
          padding: context.paddingMD.copyWith(top: 10),
          child: Row(
            crossAxisAlignment: .center,
            children: [
              TimerWidgetContent(timer: timer, onRefreshIssue: onRefreshIssue),
              TimerWidgetActions(
                timer: timer,
                onDelete: onDelete,
                onEdit: onEdit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TimerWidgetContentTop extends StatelessWidget {
  const TimerWidgetContentTop({
    super.key,
    required this.timer,
    this.redmineHost,
  });

  final Timer timer;

  final String? redmineHost;

  @override
  Widget build(BuildContext context) {
    final dotSpacer = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Text(
        '•',
        style: TextStyle(color: context.colorScheme.onSurfaceVariant),
      ),
    );

    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(
          timer.issue?.subject ?? timer.subject ?? 'Manual Timer',
          style: context.textTheme.titleMedium?.copyWith(fontWeight: .bold),
          maxLines: 2,
          overflow: .ellipsis,
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            if (timer.issue != null)
              Icon(
                Icons.folder_outlined,
                size: 14,
                color: context.colorScheme.onSurfaceVariant,
              ),
            const SizedBox(width: 4),
            Flexible(
              child: Text(
                timer.issue?.project.name ?? '',
                softWrap: true,
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
            if (timer.issueId != null) ...[
              dotSpacer,
              RichText(
                softWrap: true,
                text: TextSpan(
                  text: '#${timer.issueId}',
                  style: context.textTheme.bodySmall?.copyWith(
                    color: context.colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => launchUrl(
                      Uri.parse('https://$redmineHost/issues/${timer.issueId}'),
                    ),
                ),
              ),
              if (timer.issue?.tracker != null) ...[
                dotSpacer,
                Text(
                  timer.issue!.tracker!.name,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: context.colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ],
          ],
        ),
      ],
    );
  }
}

class TimerWidgetContentBottom extends HookConsumerWidget {
  const TimerWidgetContentBottom({
    super.key,
    required this.timer,
    required this.currentDuration,
    this.onRefreshIssue,
  });

  final Timer timer;

  final Duration currentDuration;

  final void Function(Timer timer)? onRefreshIssue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 300),
    );

    final boxShadow = !timer.isRunning
        ? null
        : [
            BoxShadow(
              color: context.colorScheme.primary.withAlpha(
                (255 * 0.3 * animationController.value).toInt(),
              ),
              blurRadius: 12,
              spreadRadius: 2,
            ),
          ];

    return Row(
      crossAxisAlignment: .end,
      children: [
        AnimatedBuilder(
          animation: animationController,
          builder: (context, child) {
            return Container(
              decoration: BoxDecoration(shape: .circle, boxShadow: boxShadow),
              child: child,
            );
          },
          child: IconButton.filled(
            onPressed: () {
              ref.read(timersProvider.notifier).toggle(timer);
            },
            icon: Icon(timer.isRunning ? Icons.pause : Icons.play_arrow),
            iconSize: 32,
            padding: const EdgeInsets.all(12),
            color: context.colorScheme.onSecondary,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _formatDuration(currentDuration),
                style: context.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontFeatures: const [FontFeature.tabularFigures()],
                ),
              ),
              if (timer.isRunning)
                Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: context.colorScheme.error,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Running',
                      style: context.textTheme.bodySmall?.copyWith(
                        color: context.colorScheme.error,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                )
              else
                Text(
                  'Paused',
                  style: context.textTheme.bodySmall?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                ),
            ],
          ),
        ),
        if (timer.issue != null)
          Padding(
            padding: context.paddingSM.copyWith(
              right: context.paddingLG.right,
              bottom: 0,
            ),
            child: Row(
              children: [
                FilledButton(
                  onPressed: () => onRefreshIssue == null
                      ? null
                      : () => onRefreshIssue!(timer),
                  child: Row(
                    spacing: context.paddingSM.left,
                    children: [Icon(Icons.update_outlined)],
                  ),
                ),
                context.gapSM,
                FilledButton(
                  onPressed: () => showDialog(
                    context: context,
                    builder: (context) => PostTimeDialog(timer: timer),
                  ),
                  child: Row(
                    spacing: context.paddingSM.left,
                    children: [Icon(Icons.timer_outlined), Text('Post')],
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    if (hours > 0) {
      return '${hours.toString().padLeft(2, '0')}:'
          '${minutes.toString().padLeft(2, '0')}:'
          '${seconds.toString().padLeft(2, '0')}';
    } else {
      return '${minutes.toString().padLeft(2, '0')}:'
          '${seconds.toString().padLeft(2, '0')}';
    }
  }
}

class TimerWidgetContent extends HookConsumerWidget {
  const TimerWidgetContent({
    super.key,
    required this.timer,
    this.onRefreshIssue,
  });

  final Timer timer;

  final void Function(Timer timer)? onRefreshIssue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);

    final currentDuration = useState(timer.totalTime);
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 300),
    );

    useEffect(() {
      if (timer.isRunning) {
        animationController.repeat(reverse: true);
      } else {
        animationController.stop();
        animationController.value = 0;
      }
      return null;
    }, [timer.isRunning]);

    useEffect(() {
      if (!timer.isRunning) {
        currentDuration.value = timer.totalTime;
        return null;
      }

      final startTime = timer.lastStartOn ?? DateTime.timestamp();
      final elapsed = DateTime.timestamp().difference(startTime);
      currentDuration.value = timer.totalTime + elapsed;

      final periodicTimer = Stream.periodic(const Duration(seconds: 1), (_) {
        final now = DateTime.timestamp();
        final newElapsed = now.difference(startTime);
        currentDuration.value = timer.totalTime + newElapsed;
      }).listen((_) {});

      return periodicTimer.cancel;
    }, [timer.isRunning, timer.lastStartOn, timer.totalTime]);

    return Expanded(
      child: Column(
        mainAxisAlignment: .spaceBetween,
        children: [
          TimerWidgetContentTop(
            timer: timer,
            redmineHost: settings.redmineHost,
          ),
          TimerWidgetContentBottom(
            timer: timer,
            currentDuration: currentDuration.value,
            onRefreshIssue: onRefreshIssue,
          ),
        ],
      ),
    );
  }
}

class TimerWidgetActions extends ConsumerWidget {
  const TimerWidgetActions({
    super.key,
    required this.timer,
    this.onDelete,
    this.onEdit,
  });

  final Timer timer;

  final VoidCallback? onDelete;

  final OnTimerFormDialogSubmit? onEdit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      spacing: context.paddingSM.bottom,
      children: [
        IconButton.filledTonal(
          onPressed: timer.totalTime.inSeconds > 0
              ? () => ref.read(timersProvider.notifier).reset(timer.id)
              : null,
          icon: const Icon(Icons.refresh),
          tooltip: 'Reset',
        ),
        IconButton.filledTonal(
          onPressed: () => showDialog(
            context: context,
            builder: (context) =>
                TimerFormDialog(timer: timer, onSubmit: onEdit),
          ),
          icon: const Icon(Icons.edit_outlined),
          tooltip: 'Edit',
        ),
        IconButton.filledTonal(
          color: context.colorScheme.error,
          icon: const Icon(Icons.delete_outline),
          onPressed: onDelete?.call,
        ),
      ],
    );
  }
}
