import 'package:flutter/material.dart';

import '../colors.dart';
import '../constants.dart';
import 'button_loading_indicator.dart';

const double buttonHeight = 42;
const double buttonHeightSmall = 38;
const double btnFontSize = 15;
const double btnFontSizeSmall = 14;

class CustomMaterialButton {
  CustomMaterialButton();
  createButton(
      {required VoidCallback? function,
      required String label,
      String loadingLabel = "",
      bool loading = false,
      double paddingY = 0.0,
      Color? color,
      Color? disabledColor,
      double radius = 0.0}) {
    return MaterialButton(
      onPressed: loading ? null : function,
      minWidth: double.infinity,
      height: buttonHeight,
      textTheme: ButtonTextTheme.normal,
      disabledTextColor: Colors.white,
      textColor: Colors.white,
      color: color ?? cPrimary,
      elevation: 0,
      focusElevation: 5,
      padding: EdgeInsets.symmetric(vertical: paddingY),
      highlightElevation: 5,
      disabledColor: disabledColor ?? cPrimary.withOpacity(0.6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(btnRadius + radius),
      ),
      child: loading
          ? false
              ? const LoadingIndicator(
                  size: btnFontSize,
                  stroke: 2,
                )
              : Text(
                  loadingLabel,
                  style: const TextStyle(
                    fontSize: btnFontSize,
                    fontWeight: FontWeight.w400,
                  ),
                )
          : Text(
              label,
              style: const TextStyle(
                fontSize: btnFontSize,
                fontWeight: FontWeight.w400,
              ),
            ),
    );
  }

  createCancelButton(
      {required VoidCallback function,
      required String label,
      String loadingLabel = "",
      bool loading = false,
      double paddingY = 0.0,
      double radius = 0.0,
      Color color = cPrimary}) {
    return MaterialButton(
      onPressed: loading ? null : function,
      minWidth: double.infinity,
      height: buttonHeight,
      textTheme: ButtonTextTheme.normal,
      disabledTextColor: Colors.white,
      textColor: color,
      color: color.withOpacity(0.05),
      elevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
      padding: EdgeInsets.symmetric(vertical: paddingY),
      disabledColor: cPrimary.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(btnRadius + radius),
      ),
      child: loading
          ? Text(
              loadingLabel,
              style: const TextStyle(
                fontSize: btnFontSize,
                fontWeight: FontWeight.w400,
              ),
            )
          : Text(
              label,
              style: const TextStyle(
                fontSize: btnFontSize,
                fontWeight: FontWeight.w400,
              ),
            ),
    );
  }

  createButtonSmall(
      {required VoidCallback function,
      required String label,
      required String loadingLabel,
      bool loading = false}) {
    return MaterialButton(
      onPressed: loading ? null : function,
      textTheme: ButtonTextTheme.normal,
      disabledTextColor: Colors.white,
      textColor: Colors.white,
      color: cPrimary,
      elevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
      disabledColor: cPrimary.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(btnRadius),
      ),
      child: loading
          ? Text(
              loadingLabel,
              style: const TextStyle(
                fontSize: btnFontSizeSmall,
                fontWeight: FontWeight.w400,
              ),
            )
          : Text(
              label,
              style: const TextStyle(
                fontSize: btnFontSizeSmall,
                fontWeight: FontWeight.w400,
              ),
            ),
    );
  }

  createCancelButtonSmall(
      {required VoidCallback function,
      required String label,
      required String loadingLabel,
      bool loading = false}) {
    return MaterialButton(
      onPressed: loading ? null : function,
      height: buttonHeightSmall,
      textTheme: ButtonTextTheme.normal,
      disabledTextColor: Colors.white,
      textColor: cPrimary,
      color: cPrimary.withOpacity(0.1),
      elevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
      disabledColor: cPrimary.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(btnRadius),
      ),
      child: loading
          ? Text(
              loadingLabel,
              style: const TextStyle(
                fontSize: btnFontSizeSmall,
                fontWeight: FontWeight.w400,
              ),
            )
          : Text(
              label,
              style: const TextStyle(
                fontSize: btnFontSizeSmall,
                fontWeight: FontWeight.w500,
              ),
            ),
    );
  }

  createIconTextButtonSmall(
      {required VoidCallback function,
      required IconData icon,
      required String label,
      required String loadingLabel,
      bool loading = false}) {
    return MaterialButton(
      onPressed: loading ? null : function,
      height: buttonHeightSmall,
      textTheme: ButtonTextTheme.normal,
      disabledTextColor: Colors.white,
      textColor: Colors.white,
      color: cPrimary,
      elevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
      disabledColor: cPrimary.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(btnRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Column(
          children: [
            Icon(icon),
            const SizedBox(
              height: 8,
            ),
            loading
                ? Text(
                    loadingLabel,
                    style: const TextStyle(
                      fontSize: btnFontSizeSmall,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                : Text(
                    label,
                    style: const TextStyle(
                      fontSize: btnFontSizeSmall,
                      fontWeight: FontWeight.w400,
                    ),
                  )
          ],
        ),
      ),
    );
  }
}

class CustomOutlineButton {
  CustomOutlineButton();
  createButton({
    required VoidCallback function,
    required String label,
    String loadingLabel = "",
    bool loading = false,
    Color color = cPrimary,
    double radius = btnRadius,
    double verticalP = p2,
    double minHeight = buttonHeight,
  }) {
    return OutlinedButton(
      onPressed: loading ? null : function,
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.symmetric(
            horizontal: p4 * 2,
            vertical: verticalP,
          ),
        ),
        foregroundColor: MaterialStateProperty.all<Color?>(color),
        overlayColor: MaterialStateProperty.all<Color?>(color.withOpacity(0.2)),
        backgroundColor: MaterialStateProperty.all<Color?>(cTransparent),
        shadowColor: MaterialStateProperty.all<Color?>(cTransparent),
        surfaceTintColor: MaterialStateProperty.all<Color?>(cTransparent),
        side: MaterialStateProperty.all<BorderSide?>(
          BorderSide(color: color),
        ),
        minimumSize: MaterialStateProperty.all<Size?>(
          Size(buttonHeight, minHeight),
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius),
            ),
          ),
        ),
      ),
      child: loading
          ? Text(
              loadingLabel,
              style: TextStyle(
                fontSize: btnFontSize,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            )
          : Text(
              label,
              style: TextStyle(
                fontSize: btnFontSize,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
    );
  }

  createButtonWithIcon(
      {required VoidCallback function,
      required String label,
      required String loadingLabel,
      required Widget child,
      bool loading = false}) {
    return OutlinedButton(
      onPressed: loading ? null : function,
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(
            horizontal: p4 * 2,
            vertical: p1,
          ),
        ),
        foregroundColor: MaterialStateProperty.all<Color?>(cPrimary),
        side: MaterialStateProperty.all<BorderSide?>(
          const BorderSide(color: cPrimary),
        ),
        minimumSize: MaterialStateProperty.all<Size?>(
          const Size(buttonHeight, buttonHeight),
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(btnRadius),
            ),
          ),
        ),
      ),
      child: loading
          ? Row(
              children: [
                child,
                Text(
                  loadingLabel,
                  style: const TextStyle(
                    fontSize: btnFontSize,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                child,
                Expanded(
                  child: Text(
                    label,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: btnFontSize,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  createButtonSmall(
      {required VoidCallback function,
      required String label,
      required String loadingLabel,
      bool loading = false}) {
    return OutlinedButton(
      onPressed: loading ? null : function,
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(
            horizontal: p4,
            vertical: p1,
          ),
        ),
        foregroundColor: MaterialStateProperty.all<Color?>(cPrimary),
        side: MaterialStateProperty.all<BorderSide?>(
          const BorderSide(color: cPrimary),
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(btnRadius),
            ),
          ),
        ),
      ),
      child: loading
          ? Text(
              loadingLabel,
              style: const TextStyle(
                fontSize: btnFontSizeSmall,
                fontWeight: FontWeight.w400,
              ),
            )
          : Text(
              label,
              style: const TextStyle(
                fontSize: btnFontSizeSmall,
                fontWeight: FontWeight.w400,
              ),
            ),
    );
  }
}

class CustomTextButton {
  CustomTextButton();
  createTextButton(
      {required VoidCallback function,
      required String label,
      required String loadingLabel,
      bool loading = false}) {
    return TextButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
      ),
      onPressed: loading ? null : function,
      child: loading
          ? Text(
              loadingLabel,
              style: const TextStyle(
                fontSize: btnFontSize,
                fontWeight: FontWeight.w400,
              ),
            )
          : Text(
              label,
              style: const TextStyle(
                fontSize: btnFontSize,
                fontWeight: FontWeight.w400,
              ),
            ),
    );
  }

  createSmallTextButton(
      {required VoidCallback function,
      required String label,
      required String loadingLabel,
      bool loading = false}) {
    return TextButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
      ),
      onPressed: loading ? null : function,
      child: loading
          ? Text(
              loadingLabel,
              style: const TextStyle(
                fontSize: btnFontSizeSmall,
                fontWeight: FontWeight.w400,
              ),
            )
          : Text(
              label,
              style: const TextStyle(
                fontSize: btnFontSizeSmall,
                fontWeight: FontWeight.w400,
              ),
            ),
    );
  }
}
