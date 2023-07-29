import 'package:flutter/material.dart';
import 'package:vgo_app/constants.dart';
import 'package:vgo_app/utils/custom_button.dart';

import '../colors.dart';

class CustomDialog extends StatelessWidget {
  final String? title;
  final String? content;
  final String? dismissText;
  final String? actionBtnText;
  final Color? color;
  final VoidCallback? actionFunction;
  const CustomDialog({
    Key? key,
    this.title,
    this.color,
    this.content,
    this.dismissText,
    this.actionBtnText,
    this.actionFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: w / 16),
      titleTextStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
            fontWeight: FontWeight.bold,
            color: cGrey2,
            fontSize: 18,
          ),
      title: title != null
          ? SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Text(
                title!,
                textAlign: TextAlign.center,
              ),
            )
          : null,
      contentTextStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
            color: cGrey4,
            fontSize: 15,
          ),
      content: content != null
          ? Padding(
              padding: const EdgeInsets.symmetric(vertical: p2),
              child: Text(
                content!,
                textAlign: TextAlign.center,
              ),
            )
          : null,
      scrollable: true,
      actionsAlignment: MainAxisAlignment.center,
      actions: <Widget>[
        actionBtnText != null
            ? CustomMaterialButton().createButton(
                function: actionFunction != null
                    ? () {
                        actionFunction!.call();
                        Navigator.of(context, rootNavigator: true).pop();
                      }
                    : () {
                        Navigator.of(context, rootNavigator: true).pop();
                      },
                label: actionBtnText!,
                // radius: p1,
                loadingLabel: '',
              )
            : const SizedBox(),
        SizedBox(height: actionBtnText != null ? p1 : 0),
        CustomMaterialButton().createCancelButton(
          function: () => Navigator.of(context, rootNavigator: true).pop(),
          label: dismissText ?? "OK",
          // radius: p1,
          loadingLabel: '',
        )
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(p2),
      ),
      contentPadding: EdgeInsets.only(
        top: title != null ? p3 / 2 : p4,
        left: p4,
        right: p4,
      ),
      titlePadding: const EdgeInsets.only(
        top: p4,
        left: p4,
        right: p4,
      ),
      actionsPadding: const EdgeInsets.symmetric(horizontal: p4, vertical: p4),
    );
  }
}

Future<Object?> customDefaultDialog(
    {required BuildContext context,
    required String? content,
    required String? dismissText,
    required String? actionBtnText,
    final Color? color,
    required VoidCallback? actionFunction,
    required String title}) {
  double w = MediaQuery.of(context).size.width;
  return showDialog<CustomDialog>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: EdgeInsets.symmetric(horizontal: w / 16),
          titleTextStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontWeight: FontWeight.bold,
                color: cGrey2,
                fontSize: 18,
              ),
          title: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Text(
              title,
              textAlign: TextAlign.center,
            ),
          ),
          contentTextStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: cGrey4,
                fontSize: 15,
              ),
          content: content != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: p2),
                  child: Text(
                    content,
                    textAlign: TextAlign.center,
                  ),
                )
              : null,
          scrollable: true,
          actionsAlignment: MainAxisAlignment.center,
          actions: <Widget>[
            actionBtnText != null
                ? CustomMaterialButton().createButton(
                    function: actionFunction != null
                        ? () {
                            actionFunction.call();
                            Navigator.of(context, rootNavigator: true).pop();
                          }
                        : () {
                            Navigator.of(context, rootNavigator: true).pop();
                          },
                    label: actionBtnText,
// radius: p1,
                    loadingLabel: '',
                  )
                : const SizedBox(),
            SizedBox(height: actionBtnText != null ? p1 : 0),
            CustomMaterialButton().createCancelButton(
              function: () => Navigator.of(context, rootNavigator: true).pop(),
              label: dismissText ?? "OK",
// radius: p1,
              loadingLabel: '',
            )
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(p2),
          ),
          contentPadding: const EdgeInsets.only(
            top: p3 / 2,
            left: p4,
            right: p4,
          ),
          titlePadding: const EdgeInsets.only(
            top: p4,
            left: p4,
            right: p4,
          ),
          actionsPadding:
              const EdgeInsets.symmetric(horizontal: p4, vertical: p4),
        );
      });
}

Future<Object?> showBottomDialog({
  required BuildContext context,
  required String? content,
  required String? dismissText,
  required String? actionBtnText,
  final Color? color,
  required VoidCallback? actionFunction,
  required String title,
}) {
  return showGeneralDialog(
      context: context,
      barrierLabel: title,
      barrierDismissible: true,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (context, anim1, anim2) {
        return Align(
          key: UniqueKey(),
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: p4, vertical: p6),
            child: Material(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(p4),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: p4, vertical: p4),
                child: Wrap(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        title,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: cGrey2,
                              fontSize: 18,
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: p3),
                      child: Text(
                        content!,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: cGrey3),
                      ),
                    ),
                    CustomMaterialButton().createButton(
                      function: () {
                        actionFunction!();
                        Navigator.of(context, rootNavigator: true).pop();
                      },
                      label: actionBtnText ?? "Continue",
                      loadingLabel: '',
                    ),
                    const SizedBox(height: p2),
                    CustomMaterialButton().createCancelButton(
                      function: () =>
                          Navigator.of(context, rootNavigator: true).pop(),
                      label: dismissText ?? "Cancel",
                      loadingLabel: '',
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(0, 0.1),
            end: const Offset(0, 0),
          ).animate(anim1),
          child: FadeTransition(
            opacity: Tween(
              begin: 0.0,
              end: 1.0,
            ).animate(anim1),
            child: child,
          ),
        );
      });
}

Future<Object?> showBottomDialogWithInputField({
  required BuildContext context,
  required Widget? content,
  required String? dismissText,
  required String? actionBtnText,
  final Color? color,
  required VoidCallback? actionFunction,
  required String title,
}) {
  return showGeneralDialog(
      context: context,
      barrierLabel: title,
      barrierDismissible: true,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (context, anim1, anim2) {
        return Align(
          key: UniqueKey(),
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: p4, vertical: p6),
            child: Material(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(p4),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: p4, vertical: p4),
                child: Wrap(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        title,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: cGrey2,
                              fontSize: 18,
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: p3),
                      child: content!,
                    ),
                    CustomMaterialButton().createButton(
                      function: () {
                        actionFunction!();
                        Navigator.of(context, rootNavigator: true).pop();
                      },
                      label: actionBtnText ?? "Continue",
                      loadingLabel: '',
                    ),
                    const SizedBox(height: p2),
                    CustomMaterialButton().createCancelButton(
                      function: () =>
                          Navigator.of(context, rootNavigator: true).pop(),
                      label: dismissText ?? "Cancel",
                      loadingLabel: '',
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(0, 0.1),
            end: const Offset(0, 0),
          ).animate(anim1),
          child: FadeTransition(
            opacity: Tween(
              begin: 0.0,
              end: 1.0,
            ).animate(anim1),
            child: child,
          ),
        );
      });
}

Future<Object?> showBottomMultiActionDialog({
  required BuildContext context,
  required String? content,
  required String? dismissText,
  required String? actionBtnText,
  final Color? color,
  required VoidCallback? actionFunction,
  required VoidCallback? actionFunction2,
  required String title,
}) {
  return showGeneralDialog(
      context: context,
      barrierLabel: title,
      barrierDismissible: true,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (context, anim1, anim2) {
        return Align(
          key: Key(title),
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: p4, vertical: p6),
            child: Material(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(p4),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: p4, vertical: p4),
                child: Wrap(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        title,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: cGrey2,
                              fontSize: 18,
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: p3),
                      child: Text(
                        content!,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: cGrey3),
                      ),
                    ),
                    CustomMaterialButton().createButton(
                      function: () {
                        actionFunction!();
                        Navigator.of(context, rootNavigator: true).pop();
                      },
                      label: actionBtnText ?? "Continue",
                      loadingLabel: '',
                    ),
                    const SizedBox(height: p2),
                    CustomMaterialButton().createCancelButton(
                      function: () {
                        actionFunction2!();
                        Navigator.of(context, rootNavigator: true).pop();
                      },
                      label: dismissText ?? "Cancel",
                      loadingLabel: '',
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(0, 0.1),
            end: const Offset(0, 0),
          ).animate(anim1),
          child: FadeTransition(
            opacity: Tween(
              begin: 0.0,
              end: 1.0,
            ).animate(anim1),
            child: child,
          ),
        );
      });
}

class CustomDialogWithOptions extends StatelessWidget {
  final String? title;
  final List<Widget> optionList;
  final String? dismissText;
  final String? actionBtnText;
  final VoidCallback? actionFunction;
  const CustomDialogWithOptions({
    Key? key,
    this.title,
    required this.optionList,
    this.dismissText,
    this.actionBtnText,
    this.actionFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key: UniqueKey(),
      insetPadding: const EdgeInsets.all(p5),
      titleTextStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
            fontWeight: FontWeight.bold,
            color: cGrey2,
          ),
      title: title != null
          ? SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Text(title!),
            )
          : null,
      content: Column(
        children: optionList,
      ),
      scrollable: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(btnRadius),
      ),
      titlePadding: const EdgeInsets.only(
        top: p3,
        left: p4,
        right: p4,
      ),
      contentPadding: EdgeInsets.only(
        top: title != null ? p4 / 2 : p3,
        left: 0,
        right: 0,
        bottom: p3,
      ),
      actionsPadding: const EdgeInsets.only(
        left: p4,
        right: p4 / 2,
      ),
    );
  }
}

class OptionItem extends StatelessWidget {
  final VoidCallback onTap;
  final String label;
  final Widget? prefix;
  const OptionItem({
    Key? key,
    required this.onTap,
    required this.label,
    this.prefix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
        onTap();
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: p4,
              vertical: p3,
            ),
            child: Row(
              children: [
                prefix != null ? prefix! : const SizedBox(),
                prefix != null
                    ? const SizedBox(
                        width: p4,
                      )
                    : const SizedBox(),
                Text(label),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomLoadingStateDialog {
  CustomLoadingStateDialog();

  createDialog(
    BuildContext context,
  ) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      useRootNavigator: true,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Material(
            color: Colors.black12,
            child: Center(
              child: Container(
                height: 60,
                width: 60,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: const CircularProgressIndicator(
                  color: cPrimary,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
