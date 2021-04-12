import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/utils/statics/asset_names.dart';
import 'package:portfolio/utils/statics/colors.dart';

class HomePageMobile extends StatelessWidget {
  final TextStyle _whiteBigTextStyle = TextStyle(
      color: PortfolioColors.white,
      fontSize: 24.sp,
      fontWeight: FontWeight.w400);
  final TextStyle _blueBigTextStyle = TextStyle(
      color: PortfolioColors.lightBlue,
      fontSize: 24.sp,
      fontWeight: FontWeight.w400);

  final TextStyle _whiteSmallTextStyle = TextStyle(
      color: PortfolioColors.white,
      fontSize: 16.sp,
      fontWeight: FontWeight.w300);
  final TextStyle _blueSmallTextStyle = TextStyle(
      color: PortfolioColors.lightBlue,
      fontSize: 16.sp,
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
          Container(
              margin: EdgeInsets.only(top: 102.h),
              alignment: Alignment.topCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: new TextSpan(
                        text: "My name is ",
                        style: _whiteBigTextStyle,
                        children: [
                          TextSpan(
                              text: "Szymon Stasik", style: _blueBigTextStyle),
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
                    height: 16.h,
                  ),
                  Center(
                      child: LottieBuilder.asset(
                    ASSET_ANIMATIONS_MOBILE2,
                    width: 250.w,
                    height: 250.h,
                  )),
                  SizedBox(
                    height: 16.h,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: new TextSpan(
                        text: "To do more than just ",
                        style: _whiteSmallTextStyle,
                        children: [
                          TextSpan(text: "code.\n", style: _blueSmallTextStyle),
                          TextSpan(
                            text: "Besides writing ",
                            style: _whiteSmallTextStyle,
                          ),
                          TextSpan(
                              text: "clear code ", style: _blueSmallTextStyle),
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
                          TextSpan(
                              text: "animations", style: _blueSmallTextStyle),
                        ]),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
