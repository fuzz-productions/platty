import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:platty/src/widgets/platform.dart';

/// A Platform-Specific Button that conforms to iOS and Android as appropriate.
/// On Android, this is [RaisedButton]
/// On iOS, this is a [CupertinoButton]
class PButton extends PlatformAdaptingWidget {
  final Widget child;
  final VoidCallback onPressed;
  final Color disabledColor;
  final Color color;
  final EdgeInsets padding;

  final Color androidTextColor;
  final Color androidSplashColor;
  final double androidElevation;
  final double androidFocusElevation;
  final double androidHoverElevation;
  final double androidHighlightElevation;
  final double androidDisabledElevation;
  final Clip androidClipBehavior;
  final Brightness androidColorBrightness;
  final MaterialTapTargetSize androidMaterialTapTargetSize;
  final Duration androidAnimationDuration;
  final ShapeBorder androidShape;
  final Color androidHighlightColor;
  final ButtonTextTheme androidTextTheme;
  final ValueChanged<bool> androidOnHighlightChanged;
  final Color androidDisabledTextColor;
  final Color androidFocusColor;
  final Color androidHoverColor;
  final FocusNode androidFocusNode;
  final bool androidAutofocus;

  final BorderRadius iosBorderRadius;
  final double iosPressedOpacity;
  final double iosMinSize;

  const PButton(
      {Key key,
      @required this.child,
      this.onPressed,
      this.color,
      this.disabledColor,
      this.padding,
      this.androidShape,
      this.iosBorderRadius = const BorderRadius.all(Radius.circular(8.0)),
      this.iosPressedOpacity = 0.1,
      this.iosMinSize = 44.0,
      this.androidTextColor,
      this.androidSplashColor,
      this.androidElevation,
      this.androidDisabledElevation,
      this.androidHighlightElevation,
      this.androidColorBrightness,
      this.androidClipBehavior = Clip.none,
      this.androidAnimationDuration,
      this.androidMaterialTapTargetSize,
      this.androidHighlightColor,
      this.androidTextTheme,
      this.androidDisabledTextColor,
      this.androidOnHighlightChanged,
      this.androidFocusColor,
      this.androidHoverColor,
      this.androidFocusNode,
      this.androidAutofocus = false,
      this.androidFocusElevation,
      this.androidHoverElevation,
      TargetPlatform renderPlatform})
      : super(key: key, renderPlatform: renderPlatform);

  get renderMaterial => (BuildContext context) {
        final disabledColor =
            this.disabledColor ?? Theme.of(context)?.disabledColor;
        return RaisedButton(
          child: child,
          onPressed: onPressed,
          color: color,
          padding: padding,
          shape: androidShape,
          textColor: androidTextColor,
          splashColor: androidSplashColor,
          disabledColor: disabledColor,
          elevation: androidElevation,
          disabledElevation: androidDisabledElevation,
          highlightElevation: androidHighlightElevation,
          colorBrightness: androidColorBrightness,
          clipBehavior: androidClipBehavior,
          materialTapTargetSize: androidMaterialTapTargetSize,
          animationDuration: androidAnimationDuration,
          highlightColor: androidHighlightColor,
          textTheme: androidTextTheme,
          disabledTextColor: androidDisabledTextColor,
          onHighlightChanged: androidOnHighlightChanged,
          focusColor: androidFocusColor,
          hoverColor: androidHoverColor,
          focusNode: androidFocusNode,
          autofocus: androidAutofocus,
          focusElevation: androidFocusElevation,
          hoverElevation: androidHoverElevation,
        );
      };

  get renderCupertino => (BuildContext context) {
        // patch material button color to match styling.
        final colorFromTheme =
            this.color ?? CupertinoTheme.of(context)?.primaryColor;
        final disabledColor =
            this.disabledColor ?? Theme.of(context)?.disabledColor;
        return CupertinoButton(
          child: child,
          onPressed: onPressed,
          color: colorFromTheme,
          padding: padding,
          disabledColor: disabledColor,
          borderRadius: iosBorderRadius,
          pressedOpacity: iosPressedOpacity,
          minSize: iosMinSize,
        );
      };
}

class PAlertData {
  final bool isDestructiveAction;
  final bool isDefaultAction;
  final TextStyle textStyle;

  PAlertData({
    this.isDestructiveAction = false,
    this.isDefaultAction = false,
    this.textStyle,
  });
}

/// A Platform-Specific Button that conforms to iOS and Android as appropriate.
/// On Android this is [FlatButton]
/// On iOS this is [CupertinoButton]
class PFlatButton extends PlatformAdaptingWidget {
  final Widget child;
  final VoidCallback onPressed;
  final Color color;

  /// the text color of the [PFlatButton]
  final Color disabledColor;
  final EdgeInsets padding;
  final ShapeBorder androidShape;
  final BorderRadius iosBorderRadius;
  final double iosPressedOpacity;
  final double iosMinSize;
  final PAlertData iosAlertData;

  final ValueChanged<bool> androidOnHighlightChanged;
  final ButtonTextTheme androidTextTheme;
  final Color androidTextColor;
  final Color androidDisabledTextColor;
  final Color androidFocusColor;
  final Color androidHoverColor;
  final Color androidHighlightColor;
  final Color androidSplashColor;
  final Brightness androidColorBrightness;
  final Clip androidClipBehavior;
  final FocusNode androidFocusNode;
  final bool androidAutofocus;
  final MaterialTapTargetSize androidMaterialTapTargetSize;

  const PFlatButton(
      {Key key,
      @required this.child,
      this.onPressed,
      this.color,
      this.disabledColor,
      this.padding,
      this.androidShape,
      this.iosBorderRadius,
      this.iosPressedOpacity = 0.1,
      this.iosMinSize = 44.0,
      this.iosAlertData,
      this.androidOnHighlightChanged,
      this.androidTextTheme,
      this.androidTextColor,
      this.androidDisabledTextColor,
      this.androidFocusColor,
      this.androidHoverColor,
      this.androidHighlightColor,
      this.androidSplashColor,
      this.androidColorBrightness,
      this.androidClipBehavior = Clip.none,
      this.androidFocusNode,
      this.androidAutofocus = false,
      this.androidMaterialTapTargetSize,
      TargetPlatform renderPlatform})
      : super(key: key, renderPlatform: renderPlatform);

  /// constructs a button themed for [PAlertDialog]
  factory PFlatButton.alertPrimary({
    Key key,
    String text,
    VoidCallback onPressed,
  }) =>
      PFlatButton(
        key: key,
        child: Text(text),
        onPressed: onPressed,
        iosAlertData: PAlertData(isDefaultAction: true),
      );

  /// constructs a button themed for [PAlertDialog]
  factory PFlatButton.alertSecondary({
    Key key,
    String text,
    VoidCallback onPressed,
  }) =>
      PFlatButton(
        key: key,
        child: Text(text),
        onPressed: onPressed,
        iosAlertData: PAlertData(isDestructiveAction: true),
      );

  @override
  get renderMaterial => (BuildContext context) {
        return FlatButton(
          child: child,
          onPressed: onPressed,
          color: color,
          disabledColor: disabledColor,
          padding: padding,
          shape: androidShape,
          onHighlightChanged: androidOnHighlightChanged,
          textTheme: androidTextTheme,
          textColor: androidTextColor,
          disabledTextColor: androidDisabledTextColor,
          focusColor: androidFocusColor,
          hoverColor: androidHoverColor,
          highlightColor: androidHighlightColor,
          splashColor: androidSplashColor,
          colorBrightness: androidColorBrightness,
          clipBehavior: androidClipBehavior,
          focusNode: androidFocusNode,
          autofocus: androidAutofocus,
          materialTapTargetSize: androidMaterialTapTargetSize,
        );
      };

  @override
  get renderCupertino => (BuildContext context) {
        final iosAlertData = this.iosAlertData;
        if (iosAlertData != null) {
          return CupertinoDialogAction(
            isDefaultAction: iosAlertData.isDefaultAction,
            isDestructiveAction: iosAlertData.isDestructiveAction,
            child: this.child,
            onPressed: this.onPressed,
            textStyle: iosAlertData.textStyle,
          );
        }
        final disabledColor = this.disabledColor ??
            CupertinoTheme.of(context)?.primaryContrastingColor;
        return CupertinoButton(
          child: child,
          color: color,
          onPressed: onPressed,
          disabledColor: disabledColor,
          padding: padding,
          borderRadius: iosBorderRadius,
          pressedOpacity: iosPressedOpacity,
          minSize: iosMinSize,
        );
      };
}
