import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ornek_proje/common_widget/platform_responsive_widget.dart';

class PlatformResponsiveAlertDialog extends PlatformResponsiveWidget {
  final String title;
  final String content;
  final String mainButtonText;
  final String subButtonText;

  PlatformResponsiveAlertDialog(
      {@required this.title,
      @required this.content,
      @required this.mainButtonText,
      this.subButtonText});

  Future<bool> showPlatformDialog(BuildContext context) async {
    return Platform.isIOS
        ? await showCupertinoDialog<bool>(
            context: context, builder: (context) => this)
        : await showDialog<bool>(
            context: context,
            builder: (context) => this,
            barrierDismissible: true);
  }

  @override
  Widget buildAndroidWidget(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: _dialogButtonConfigure(context),
    );
  }

  @override
  Widget buildIOSWidget(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      actions: _dialogButtonConfigure(context),
    );
  }

  List<Widget> _dialogButtonConfigure(BuildContext context) {
    final allButtons = <Widget>[];

    if (Platform.isIOS) {
      if (subButtonText != null) {
        allButtons.add(CupertinoDialogAction(
          child: Text(subButtonText),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ));
      }

      allButtons.add(
        CupertinoDialogAction(
          child: Text(mainButtonText),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
      );
    } else {
      if (subButtonText != null) {
        allButtons.add(TextButton(
          child: Text(subButtonText),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ));
      }
      allButtons.add(TextButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: Text(mainButtonText)));
    }

    return allButtons;
  }
}
