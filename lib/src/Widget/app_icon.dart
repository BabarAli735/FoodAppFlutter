import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AppIcon extends StatelessWidget {
  final IconData iconData;
  final Color? backgroundColor;
  final Color? iconColor;
  final double size;
  const AppIcon(
      {super.key,
      required this.iconData,
      this.backgroundColor = Colors.white70,
      this.iconColor = Colors.black38,
      this.size = 40});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size / 2),
          color: backgroundColor),
      child: Icon(
        iconData,
        color: iconColor,
        size: 16,
      ),
    );
  }
}
