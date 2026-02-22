import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ritt/app/ui/dialogs/request_dialog.dart';

extension AsyncValueDialog on AsyncValue {
  void showError(BuildContext context) {
    if (!isLoading && hasError) {
      RequestDialog.showFailed(context, error);
    }
  }
}
