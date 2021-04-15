import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/utils/statics/asset_names.dart';
import 'package:portfolio/utils/statics/colors.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

class HomePageDesktop extends StatelessWidget {
  final TextStyle _whiteBigTextStyle = TextStyle(
      color: PortfolioColors.white,
      fontSize: 52.sp,
      fontWeight: FontWeight.w400);
  final TextStyle _blueBigTextStyle = TextStyle(
      color: PortfolioColors.lightBlue,
      fontSize: 52.sp,
      fontWeight: FontWeight.w400);

  final TextStyle _whiteSmallTextStyle = TextStyle(
      color: PortfolioColors.white,
      fontSize: 22.sp,
      fontWeight: FontWeight.w300);
  final TextStyle _blueSmallTextStyle = TextStyle(
      color: PortfolioColors.lightBlue,
      fontSize: 22.sp,
      fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Image.asset(ASSET_BACKGROUND,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover),
          Positioned(
              right: 10.w,
              bottom: 110.h,
              child: LottieBuilder.asset(
                ASSET_ANIMATIONS_MOBILE2,
                width: 601.w,
                height: 601.h,
              )),
          PlayAnimation(
            tween: Tween<Offset>(begin: Offset(0, -250.h), end: Offset.zero),
            curve: Curves.easeInOutSine,
            builder: (context, child, value) =>
                Transform.translate(offset: value, child: child),
            child: Container(
                margin: EdgeInsets.only(left: 100.w, top: 186.h),
                width: 700.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: new TextSpan(
                          text: "My name is ",
                          style: _whiteBigTextStyle,
                          children: [
                            TextSpan(
                                text: "Szymon Stasik",
                                style: _blueBigTextStyle),
                            TextSpan(
                              text: ",\nborn in Poland I develop\n",
                              style: _whiteBigTextStyle,
                            ),
                            TextSpan(
                                text: "Mobile Applications",
                                style: _blueBigTextStyle)
                          ]),
                    ),
                    SizedBox(
                      height: 48.h,
                    ),
                  ],
                )),
          ),
          PlayAnimation(
            tween: Tween<Offset>(begin: Offset(0, 250.h), end: Offset.zero),
            curve: Curves.easeInOutSine,
            builder: (context, child, value) =>
                Transform.translate(offset: value, child: child),
            child: Container(
              alignment: Alignment.bottomLeft,
              margin: EdgeInsets.only(bottom: 130.h, left: 105.w),
              child: RichText(
                textAlign: TextAlign.start,
                text: new TextSpan(
                    text: "To do more than just ",
                    style: _whiteSmallTextStyle,
                    children: [
                      TextSpan(text: "code.\n", style: _blueSmallTextStyle),
                      TextSpan(
                        text: "Besides writing ",
                        style: _whiteSmallTextStyle,
                      ),
                      TextSpan(text: "clear code ", style: _blueSmallTextStyle),
                      TextSpan(
                        text: "and\n",
                        style: _whiteSmallTextStyle,
                      ),
                      TextSpan(text: "tests ", style: _blueSmallTextStyle),
                      TextSpan(
                        text: "I stive to implement\n",
                        style: _whiteSmallTextStyle,
                      ),
                      TextSpan(
                          text: "beautiful designs ",
                          style: _blueSmallTextStyle),
                      TextSpan(
                        text: "and ",
                        style: _whiteSmallTextStyle,
                      ),
                      TextSpan(text: "animations", style: _blueSmallTextStyle),
                    ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
