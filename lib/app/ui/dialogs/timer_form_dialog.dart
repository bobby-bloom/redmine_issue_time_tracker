import 'package:flutter/material.dart' hide FormField, TextField, Form;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ritt/app/theme/theme_extensions.dart';
import 'package:ritt/app/ui/dialogs/request_dialog.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart'
    show Form, FormField, FormKey, InputKey, SubmitButton, TextField;

import '../../models/timer.dart';

typedef OnTimerFormDialogSubmit =
    Future<void> Function(int? issueId, String? subject);

class TimerFormDialog extends ConsumerWidget {
  const TimerFormDialog({super.key, this.timer, this.onSubmit});

  final Timer? timer;

  final OnTimerFormDialogSubmit? onSubmit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final idFormKey = InputKey('issue-id');
    final subjectFormKey = InputKey('timer-subject-id');

    Future<void> handleSubmit(Map<FormKey, dynamic> form) async {
      bool succeded = false;
      try {
        await onSubmit?.call(
          int.tryParse(form[idFormKey] ?? ''),
          form[subjectFormKey] as String,
        );
        succeded = true;
      } catch (error) {
        if (context.mounted) {
          RequestDialog.showFailed(context, error);
        }
      }

      if (context.mounted && succeded) {
        Navigator.of(context).pop();
      }
    }

    return Dialog(
      backgroundColor: context.colorScheme.surfaceContainerLowest,
      child: Container(
        padding: context.paddingXL.copyWith(top: 24, bottom: 12),
        constraints: BoxConstraints(maxWidth: 530),
        child: IntrinsicHeight(
          child: Form(
            onSubmit: (_, form) async => await handleSubmit(form),
            child: Column(
              spacing: context.paddingMD.bottom,
              children: [
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Create a new timer',
                        softWrap: true,
                        style: context.textTheme.headlineSmall,
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
                FormField(
                  key: subjectFormKey,
                  label: Text('Subject (Will be ignored if there is a issue)'),
                  child: TextField(
                    placeholder: const Text('Drink coffee'),
                    initialValue: (timer?.subject ?? '').toString(),
                  ),
                ),
                FormField(
                  key: idFormKey,
                  label: Text('Issue id'),
                  child: TextField(
                    placeholder: const Text('12345'),
                    initialValue: (timer?.issueId ?? '').toString(),
                  ),
                ),

                SubmitButton(child: Text(timer == null ? 'Create' : 'Update')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
