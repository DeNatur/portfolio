import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/generated/locale_base.dart';
import 'package:portfolio/ui/components/blue_waves.dart';
import 'package:portfolio/ui/components/icon_row.dart';
import 'package:portfolio/ui/components/stroke_button.dart';
import 'package:portfolio/ui/desktop/about_section_title.dart';
import 'package:portfolio/utils/statics/asset_names.dart';
import 'package:portfolio/utils/statics/colors.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:portfolio/utils/widgets/web_extensions.dart';
import 'dart:math' as math;

class AboutPageDesktop extends StatelessWidget {
  final ScrollController _scrollController = new ScrollController();
  final technicalSkillsKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    final loc = Localizations.of<LocaleBase>(context, LocaleBase);

    return Scrollbar(
      isAlwaysShown: true,
      controller: _scrollController,
      child: ListView(
        controller: _scrollController,
        children: <Widget>[
          Container(
            width: 1440.w,
            height: 983.h,
            child: Stack(
              children: [
                _Background(),
                _UpperWave(),
                _PersonalInfo(loc: loc),
                _PersonalDesc(loc: loc),
                _ScrollIndicator(technicalSkillsKey: technicalSkillsKey)
              ],
            ),
          ),
          Container(
            width: 1440.w,
            height: 1085.h,
            color: PortfolioColors.radialBgEnd,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                AboutSectionTitleDesktop(
                    sectionTitle: loc.about.about,
                    section: loc.about.technical_skills),
                SizedBox(height: 136.h),
                Container(
                  key: technicalSkillsKey,
                  child: Row(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ScrollIndicator extends StatelessWidget {
  const _ScrollIndicator({
    Key key,
    @required this.technicalSkillsKey,
  }) : super(key: key);

  final GlobalKey<State<StatefulWidget>> technicalSkillsKey;

  @override
  Widget build(BuildContext context) {
    return PlayAnimation(
      delay: Duration(milliseconds: 1300),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, child, value) => Opacity(
        opacity: value,
        child: child,
      ),
      child: Container(
        alignment: Alignment.bottomCenter,
        margin: EdgeInsets.only(bottom: 250.h),
        child: Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationZ(math.pi * 0.5),
          child: Opacity(
            opacity: 0.3,
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => Scrollable.ensureVisible(
                    technicalSkillsKey.currentContext,
                    curve: Curves.easeInOutSine,
                    duration: Duration(milliseconds: 600)),
                child: LottieBuilder.asset(
                  ASSET_ANIMATIONS_ARROW,
                  height: 100.h,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PersonalDesc extends StatelessWidget {
  const _PersonalDesc({
    Key key,
    @required this.loc,
  }) : super(key: key);

  final LocaleBase loc;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 261.h,
      right: 101.w,
      width: 541.w,
      child: PlayAnimation(
        tween: Tween(begin: 0.0, end: 1.0),
        curve: Curves.easeInOutSine,
        builder: (context, child, value) =>
            Opacity(opacity: value, child: child),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              loc.about.desc_title,
              style: TextStyle(
                  color: PortfolioColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp),
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 36.h,
            ),
            Text(
              loc.about.desc,
              textAlign: TextAlign.start,
              style:
                  TextStyle(color: PortfolioColors.lightBlue, fontSize: 16.sp),
            ),
            SizedBox(
              height: 64.h,
            ),
            StrokeButton(onPressed: () {}, text: loc.about.my_resume)
          ],
        ),
      ),
    );
  }
}

class _PersonalInfo extends StatelessWidget {
  const _PersonalInfo({
    Key key,
    @required this.loc,
  }) : super(key: key);

  final LocaleBase loc;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: 101.w,
        top: 161.h,
        child: PlayAnimation(
          tween: Tween(begin: 0.0, end: 1.0),
          curve: Curves.easeInOutSine,
          builder: (context, child, value) =>
              Opacity(opacity: value, child: child),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                loc.about.about_me,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 56.sp,
                    color: PortfolioColors.white),
              ),
              SizedBox(
                height: 62.h,
              ),
              Image.asset(
                ASSET_ME,
                width: 167.h,
              ),
              SizedBox(
                height: 41.h,
              ),
              Text(
                loc.about.szymon_stasik,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: PortfolioColors.lightBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp),
              ),
              SizedBox(
                height: 36.h,
              ),
              IconContactRow()
            ],
          ),
        ));
  }
}

class _Background extends StatelessWidget {
  const _Background({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: RadialGradient(colors: [
        PortfolioColors.radialBgStart,
        PortfolioColors.radialBgEnd,
      ])),
    );
  }
}

class _UpperWave extends StatelessWidget {
  const _UpperWave({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: PlayAnimation(
        tween: Tween<Offset>(begin: Offset(0, 250.h), end: Offset.zero),
        curve: Curves.easeInOutSine,
        builder: (context, child, Offset value) => Opacity(
            opacity: 1 - (value.dy / 250.h),
            child: Transform.translate(offset: value, child: child)),
        child: BlueWaves(),
      ),
    );
  }
}
