import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:portfolio/utils/statics/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/statics/colors.dart';

class StrokeButton extends StatelessWidget {
  final Function onPressed;
  final String? text;
  final double textSize;
  final bool busy;
  final Color color;
  final EdgeInsetsGeometry margin;

  const StrokeButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      this.color = PortfolioColors.ultraLightBlue,
      this.margin = EdgeInsets.zero,
      this.textSize = 16,
      this.busy = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(border: Border.all(width: 3, color: color)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          MaterialButton(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: busy
                ? Center(
                    child: Container(
                    height: textSize,
                    width: textSize,
                    child: CircularProgressIndicator(
                        strokeWidth: 2.0,
                        valueColor: AlwaysStoppedAnimation<Color>(color)),
                  ))
                : Center(
                    child: Text(
                      text!,
                      style: TextStyle(
                          fontSize: textSize,
                          fontWeight: FontWeight.bold,
                          color: color),
                    ),
                  ),
            onPressed: onPressed as void Function()?,
          ),
        ],
      ),
    );
  }
}
