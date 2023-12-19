import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app.dart';
import 'package:flutter_app/components/custom_buttons.dart';
import 'package:flutter_app/extensions/text_extension.dart';
import 'package:flutter_app/styles/custom_texts.dart';

showSnackBar(String content) {
  final BuildContext? context = App.currentContext;
  if (context == null) {
    return null;
  }

  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(content),
  ));
}

Future? showCustomBottomSheet({
  required Widget child,
  double maxHeight = 370,
}) {
  final BuildContext? context = App.currentContext;
  if (context == null) {
    return null;
  }

  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: maxHeight,
        ),
        child: Container(
          child: child,
          padding: const EdgeInsets.only(
            left: 20,
            top: 50,
            right: 20,
            bottom: 30,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
        ),
      );
    },
  );
}

Future? showAlertBottomSheet({
  String? title,
  String? body,
}) {
  return showCustomBottomSheet(
    child: LayoutBuilder(builder: (context, constraints) {
      return Column(
        children: [
          CustomTexts.caption1(title).textCenter(),
          if (body != null) ...[
            const Spacer(),
            CustomTexts.body2(body).textCenter(),
          ],
          const Spacer(),
          const SizedBox(height: 70),
          CustomButtons.filled('확인', onPressed: () {
            Navigator.of(context).pop();
          })
        ],
      );
    }),
  );
}

Future? showAlertWithIconBottomSheet({
  required Widget icon,
  String? title,
  String? body,
}) {
  return showCustomBottomSheet(
    child: LayoutBuilder(builder: (context, constraints) {
      return Column(
        children: [
          icon,
          const SizedBox(height: 30),
          CustomTexts.caption1(title).textCenter(),
          if (body != null) ...[
            CustomTexts.body2(body).textCenter(),
          ],
          const Spacer(),
          CustomButtons.filled('확인', onPressed: () {
            Navigator.of(context).pop();
          })
        ],
      );
    }),
  );
}

Future? showConfirmBottomSheet({
  String? title,
  String? body,
}) {
  return showCustomBottomSheet(
    child: LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            if (title != null) ...[
              CustomTexts.caption1(title).textCenter(),
            ],
            if (body != null) ...[
              const Spacer(),
              CustomTexts.body2(body).textCenter(),
            ],
            const Spacer(),
            const SizedBox(height: 70),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: CustomButtons.outlined('아니오', onPressed: () {
                    Navigator.of(context).pop(false);
                  }),
                ),
                const SizedBox(width: 20),
                Flexible(
                  child: CustomButtons.filled('예', onPressed: () {
                    Navigator.of(context).pop(true);
                  }),
                ),
              ],
            )
          ],
        );
      },
    ),
  );
}

Future? showConfirmDialog(String title, String content) {
  final BuildContext? context = App.currentContext;
  if (context == null) {
    return null;
  }

  return showCupertinoDialog(
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          CupertinoDialogAction(
            child: const Text('취소'),
            onPressed: () => Navigator.of(context).pop(false),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            child: const Text('확인'),
            onPressed: () => Navigator.of(context).pop(true),
          ),
        ],
      );
    },
  );
}
