import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/statics/colors.dart';
import 'package:portfolio/utils/widgets/web_extensions.dart';

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
    return Theme(
      data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent),
      child: MaterialButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 32.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                text,
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: PortfolioColors.white),
              ),
              SizedBox(
                height: 4.h,
              ),
              current
                  ? Container(
                      width: 24.w,
                      height: 4.h,
                      decoration: BoxDecoration(
                          color: PortfolioColors.ultraLightBlue,
                          borderRadius: BorderRadius.circular(16)),
                    )
                  : Container()
            ],
          ),
        ),
      ).moveUpOnHover,
    );
  }
}
