import 'package:flutter/material.dart';
import 'package:todo/app/data/data/app_colors.dart';
import 'package:todo/app/data/data/app_typography.dart';
import 'package:todo/main.dart';

class LoadingDialog {
  static Future<void> showLoadingDialog(
      {required String message, bool isDismissible = false}) async {
    return showDialog(
        context: navigatorKey.currentState!.context,
        builder: (_) {
          return const LoadingWidget(message: "Loading..");
        });
  }

  static Future<void> showErrorDialog({required String message}) async {
    return showDialog(
      barrierDismissible: false,
      context: navigatorKey.currentState!.context,
      builder: (context) {
        return LoadingWidget(message: message);
      },
    );
  }

  static hideLoadingDialog() {
    navigatorKey.currentState!.pop();
  }

  static showSuccessDialog() {
    showDialog(
        barrierDismissible: false,
        context: navigatorKey.currentState!.context,
        builder: (_) => const SuccessDialogWidget(message: "Successfull"));
  }
}

class SuccessDialogWidget extends StatelessWidget {
  const SuccessDialogWidget({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      content: SizedBox(
        width: 250,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle_outline,
              color: Colors.green,
              size: 24,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                message,
                style: AppTypography.kBold20,
              ),
            )
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('OK'),
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: AlertDialog(
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        content: SizedBox(
            width: 250,
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator.adaptive(
                  backgroundColor: Colors.transparent,
                  valueColor: AlwaysStoppedAnimation(AppColors.kPrimary),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Text(
                    message,
                    style: AppTypography.kBold20,
                  ),
                )
              ],
            )),
      ),
    );
  }
}

void showSuccessDialog({required String message}) {
  showDialog(
    context: navigatorKey.currentContext!,
    builder: (BuildContext context) {
      return AlertDialog(
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        content: SizedBox(
          width: 250,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle_outline,
                color: Colors.green,
                size: 24,
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  message,
                  style: AppTypography.kBold20,
                ),
              )
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
