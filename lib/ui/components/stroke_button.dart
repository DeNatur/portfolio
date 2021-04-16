import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:portfolio/utils/statics/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/statics/colors.dart';

class StrokeButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Color color;
  final EdgeInsetsGeometry margin;

  const StrokeButton(
      {Key key,
      @required this.onPressed,
      @required this.text,
      this.color = PortfolioColors.ultraLightBlue,
      this.margin = EdgeInsets.zero})
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
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: PortfolioColors.ultraLightBlue),
              ),
            ),
            onPressed: () => onPressed,
          ),
        ],
      ),
    );
  }
}
