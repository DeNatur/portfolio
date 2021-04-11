import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/statics/colors.dart';

class TopTile extends StatelessWidget {
  final String text;
  final bool current;
  final Function onPressed;

  const TopTile(
      {Key key,
      @required this.text,
      @required this.current,
      @required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: PortfolioColors.white),
          ),
          SizedBox(
            height: 12.h,
          ),
          current
              ? Container(
                  width: 30.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                      color: PortfolioColors.lightBlue,
                      borderRadius: BorderRadius.circular(16)),
                )
              : Container()
        ],
      ),
    );
  }
}
