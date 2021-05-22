import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/generated/locale_base.dart';
import 'package:portfolio/utils/statics/asset_names.dart';
import 'package:portfolio/utils/statics/colors.dart';
import 'package:simple_animations/simple_animations.dart';

class HomePageTablet extends StatelessWidget {
  final TextStyle _whiteBigTextStyle = TextStyle(
      color: PortfolioColors.white,
      fontSize: 36.sp,
      fontWeight: FontWeight.w400);
  final TextStyle _blueBigTextStyle = TextStyle(
      color: PortfolioColors.lightBlue,
      fontSize: 36.sp,
      fontWeight: FontWeight.w400);

  final TextStyle _whiteSmallTextStyle = TextStyle(
      color: PortfolioColors.white,
      fontSize: 20.sp,
      fontWeight: FontWeight.w300);
  final TextStyle _blueSmallTextStyle = TextStyle(
      color: PortfolioColors.lightBlue,
      fontSize: 20.sp,
      fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    final loc = Localizations.of<LocaleBase>(context, LocaleBase)!;

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
              margin: EdgeInsets.only(top: 230.h),
              alignment: Alignment.topCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  PlayAnimation(
                    tween: Tween<Offset>(
                        begin: Offset(0, -250.h), end: Offset.zero),
                    curve: Curves.easeInOutSine,
                    builder: (context, child, Offset value) => Opacity(
                        opacity: 1 - (value.dy / -250.h),
                        child:
                            Transform.translate(offset: value, child: child)),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: new TextSpan(
                          text: loc.home!.my_name_is,
                          style: _whiteBigTextStyle,
                          children: [
                            TextSpan(
                                text: loc.home!.szymon_stasik,
                                style: _blueBigTextStyle),
                            TextSpan(
                              text: loc.home!.born_in_poland,
                              style: _whiteBigTextStyle,
                            ),
                            TextSpan(
                                text: loc.home!.mobile_applications,
                                style: _blueBigTextStyle)
                          ]),
                    ),
                  ),
                  SizedBox(
                    height: 48.h,
                  ),
                  Center(
                      child: LottieBuilder.asset(
                    ASSET_ANIMATIONS_MOBILE2,
                    width: 500.w,
                    height: 500.h,
                  )),
                  SizedBox(
                    height: 48.h,
                  ),
                  PlayAnimation(
                    tween: Tween<Offset>(
                        begin: Offset(0, 250.h), end: Offset.zero),
                    curve: Curves.easeInOutSine,
                    builder: (context, child, Offset value) => Opacity(
                        opacity: 1 - (value.dy / 250.h),
                        child:
                            Transform.translate(offset: value, child: child)),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: new TextSpan(
                          text: loc.home!.to_be_more_than,
                          style: _whiteSmallTextStyle,
                          children: [
                            TextSpan(
                                text: loc.home!.coder,
                                style: _blueSmallTextStyle),
                            TextSpan(
                              text: loc.home!.besides_writing,
                              style: _whiteSmallTextStyle,
                            ),
                            TextSpan(
                                text: loc.home!.clear_code,
                                style: _blueSmallTextStyle),
                            TextSpan(
                              text: loc.home!.and,
                              style: _whiteSmallTextStyle,
                            ),
                            TextSpan(
                                text: loc.home!.tests,
                                style: _blueSmallTextStyle),
                            TextSpan(
                              text: loc.home!.i_strive,
                              style: _whiteSmallTextStyle,
                            ),
                            TextSpan(
                                text: loc.home!.beautiful_designs,
                                style: _blueSmallTextStyle),
                            TextSpan(
                              text: loc.home!.and,
                              style: _whiteSmallTextStyle,
                            ),
                            TextSpan(
                                text: loc.home!.animations,
                                style: _blueSmallTextStyle),
                          ]),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
