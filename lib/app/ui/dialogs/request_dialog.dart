import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class RequestDialog {
  static void showFailed(BuildContext context, Object? error) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      AwesomeDialog(
        context: context,
        dialogType: .error,
        animType: .scale,
        autoDismiss: true,
        width: 600,
        title: "Oops! Something went wrong.",
        desc: error?.toString() ?? "Unknown error occured.",
      ).show();
    });
  }

  static void showSuccess(
    BuildContext context,
    String? msg, {
    VoidCallback? then,
  }) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      AwesomeDialog(
        context: context,
        dialogType: .success,
        animType: .scale,
        autoDismiss: true,
        width: 600,
        title: "Success!",
        desc: msg ?? 'Request completed successfully.',
      ).show().then((_) => then?.call());
    });
  }
}
