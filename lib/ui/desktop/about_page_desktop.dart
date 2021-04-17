import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/buisness_logic/providers.dart';
import 'package:portfolio/buisness_logic/view_models/main_viewmodel.dart';
import 'package:portfolio/generated/locale_base.dart';
import 'package:portfolio/ui/components/blue_waves.dart';
import 'package:portfolio/ui/components/icon_row.dart';
import 'package:portfolio/ui/components/stroke_button.dart';
import 'package:portfolio/ui/components/technical_skills_row.dart';
import 'package:portfolio/ui/desktop/about_section_title.dart';
import 'package:portfolio/utils/statics/asset_names.dart';
import 'package:portfolio/utils/statics/colors.dart';
import 'package:simple_animations/simple_animations.dart';
import 'dart:math' as math;

class AboutPageDesktop extends StatelessWidget {
  final ScrollController _scrollController = new ScrollController();
  final technicalSkillsKey = new GlobalKey();
  final achivmentsSkillsKey = new GlobalKey();

  final TextStyle _whiteTextStyle = TextStyle(
      color: PortfolioColors.white,
      fontSize: 16.sp,
      fontWeight: FontWeight.w400);
  final TextStyle _blueTextStyle = TextStyle(
      color: PortfolioColors.lightBlue,
      fontSize: 16.sp,
      fontWeight: FontWeight.bold);
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
                _ScrollIndicator(
                  technicalSkillsKey: technicalSkillsKey,
                  marginBottom: 250.h,
                )
              ],
            ),
          ),
          Container(
            key: technicalSkillsKey,
            width: 1440.w,
            height: 750.h,
            alignment: Alignment.center,
            color: PortfolioColors.radialBgEnd,
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(height: 24.h),
                    AboutSectionTitleDesktop(
                        sectionTitle: loc.about.about,
                        section: loc.about.technical_skills),
                    SizedBox(height: 136.h),
                    TechnicalSkillsRow(),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: _ScrollIndicator(
                      technicalSkillsKey: achivmentsSkillsKey, marginBottom: 0),
                )
              ],
            ),
          ),
          _BottomWave(),
          Container(
            key: achivmentsSkillsKey,
            width: 1440.w,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AboutSectionTitleDesktop(
                    sectionTitle: loc.about.about,
                    section: loc.about.achivments),
                SizedBox(height: 32.h),
                AchivementsRow(
                    loc: loc,
                    blueTextStyle: _blueTextStyle,
                    whiteTextStyle: _whiteTextStyle),
                SizedBox(height: 64.h),
                _SeeMyProjectsButton(loc: loc),
                SizedBox(height: 64.h),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _SeeMyProjectsButton extends HookWidget {
  const _SeeMyProjectsButton({
    Key key,
    @required this.loc,
  }) : super(key: key);

  final LocaleBase loc;

  @override
  Widget build(BuildContext context) {
    final model = useProvider(mainViewModel);
    return StrokeButton(
        onPressed: () => model.changePage(PortfolioPage.Experience),
        text: loc.about.see_my_project,
        textSize: 20.sp);
  }
}

class AchivementsRow extends StatelessWidget {
  const AchivementsRow({
    Key key,
    @required this.loc,
    @required TextStyle blueTextStyle,
    @required TextStyle whiteTextStyle,
  })  : _blueTextStyle = blueTextStyle,
        _whiteTextStyle = whiteTextStyle,
        super(key: key);

  final LocaleBase loc;
  final TextStyle _blueTextStyle;
  final TextStyle _whiteTextStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 101.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _AchivmentTile(
            image: AssetImage(ASSET_ISEF),
            descWidget: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: loc.about.intel_isef_2019,
                  style: _blueTextStyle,
                  children: [
                    TextSpan(
                        text: loc.about.in_phoenix, style: _whiteTextStyle),
                    TextSpan(
                        text: loc.about.largest_international,
                        style: _blueTextStyle),
                    TextSpan(
                        text: loc.about.science_competition,
                        style: _whiteTextStyle),
                    TextSpan(text: loc.about.amsd, style: _blueTextStyle),
                  ]),
            ),
          ),
          _AchivmentTile(
            image: AssetImage(ASSET_EXPLORY),
            descWidget: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: loc.about.explory,
                  style: _whiteTextStyle,
                  children: [
                    TextSpan(text: loc.about.nationwide, style: _blueTextStyle),
                    TextSpan(
                        text: loc.about.science_competition_explory,
                        style: _whiteTextStyle),
                    TextSpan(text: loc.about.finalist, style: _blueTextStyle),
                    TextSpan(
                        text: loc.about.and_accredited, style: _whiteTextStyle),
                    TextSpan(text: loc.about.amsd, style: _blueTextStyle),
                    TextSpan(text: loc.about.in_2020, style: _whiteTextStyle),
                    TextSpan(text: loc.about.finalist, style: _blueTextStyle),
                    TextSpan(
                        text: loc.about.with_project, style: _whiteTextStyle),
                    TextSpan(
                        text: loc.about.aider_mobile_application,
                        style: _blueTextStyle),
                  ]),
            ),
          ),
          _AchivmentTile(
            image: AssetImage(ASSET_INTARG),
            descWidget: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: loc.about.international_invention,
                  style: _whiteTextStyle,
                  children: [
                    TextSpan(text: loc.about.interg, style: _blueTextStyle),
                    TextSpan(
                        text: loc.about.main_honorary, style: _whiteTextStyle),
                    TextSpan(text: loc.about.ministry, style: _blueTextStyle),
                    TextSpan(
                        text: loc.about.in_2020_intarg, style: _whiteTextStyle),
                    TextSpan(
                        text: loc.about.bronze_medal, style: _blueTextStyle),
                    TextSpan(
                        text: loc.about.for_the_project,
                        style: _whiteTextStyle),
                    TextSpan(
                        text: loc.about.aider_mobile_application,
                        style: _blueTextStyle),
                    TextSpan(
                        text: loc.about.special_distinction,
                        style: _whiteTextStyle),
                    TextSpan(
                        text: loc.about.young_inventor, style: _blueTextStyle),
                    TextSpan(
                        text: loc.about.for_the_project,
                        style: _whiteTextStyle),
                    TextSpan(
                        text: loc.about.aider_mobile_application,
                        style: _blueTextStyle),
                  ]),
            ),
          ),
          _AchivmentTile(
            image: AssetImage(ASSET_GOOGLE),
            descWidget: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: loc.about.google,
                  style: _whiteTextStyle,
                  children: [
                    TextSpan(
                        text: loc.about.tech_mentoring, style: _blueTextStyle),
                    TextSpan(text: loc.about.program, style: _whiteTextStyle),
                    TextSpan(
                        text: loc.about.programmer_skills,
                        style: _blueTextStyle),
                    TextSpan(text: loc.about.under, style: _whiteTextStyle),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}

class _AchivmentTile extends StatelessWidget {
  final ImageProvider image;
  final Widget descWidget;
  const _AchivmentTile({
    Key key,
    @required this.image,
    @required this.descWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.w,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 120.w,
            alignment: Alignment.center,
            padding: EdgeInsets.all(20.w),
            child: Image(
              alignment: Alignment.center,
              image: image,
            ),
          ),
          SizedBox(height: 16.h),
          descWidget
        ],
      ),
    );
  }
}

class _ScrollIndicator extends StatelessWidget {
  const _ScrollIndicator({
    Key key,
    @required this.technicalSkillsKey,
    this.marginBottom,
  }) : super(key: key);

  final GlobalKey<State<StatefulWidget>> technicalSkillsKey;
  final double marginBottom;
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
        margin: EdgeInsets.only(bottom: marginBottom),
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
      width: 460.w,
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
            StrokeButton(
              onPressed: () {
                log("resume");
              },
              text: loc.about.my_resume,
              textSize: 16.sp,
            )
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

class _BottomWave extends StatelessWidget {
  const _BottomWave({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationZ(math.pi),
        child: PlayAnimation(
          tween: Tween<Offset>(begin: Offset(0, 250.h), end: Offset.zero),
          curve: Curves.easeInOutSine,
          builder: (context, child, Offset value) => Opacity(
              opacity: 1 - (value.dy / 250.h),
              child: Transform.translate(offset: value, child: child)),
          child: BlueWaves(),
        ),
      ),
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
