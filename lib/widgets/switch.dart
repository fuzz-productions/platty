import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:platty/widgets/platform.dart';

class PSwitch extends PlatformAdaptingWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color activeColor;
  final Color androidActiveTrackColor;
  final Color androidInactiveTrackColor;
  final Color androidInactiveThumbColor;

  PSwitch(
      {Key key,
      @required this.value,
      @required this.onChanged,
      this.activeColor,
      this.androidActiveTrackColor,
      this.androidInactiveThumbColor,
      this.androidInactiveTrackColor,
      TargetPlatform renderPlatform})
      : super(key: key, renderPlatform: renderPlatform);

  @override
  get renderMaterial => () {
        return Switch(
          value: value,
          onChanged: onChanged,
          activeColor: activeColor,
          activeTrackColor: androidActiveTrackColor,
          inactiveTrackColor: androidInactiveTrackColor,
          inactiveThumbColor: androidInactiveThumbColor,
        );
      };

  @override
  get renderCupertino => () {
        return CupertinoSwitch(
          value: value,
          onChanged: onChanged,
          activeColor: activeColor,
        );
      };
}
