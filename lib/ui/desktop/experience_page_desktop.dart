import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/generated/locale_base.dart';
import 'package:portfolio/ui/components/about_dialog.dart';
import 'package:portfolio/ui/components/blue_waves.dart';
import 'package:portfolio/ui/desktop/card_desktop.dart';
import 'package:portfolio/utils/statics/asset_names.dart';
import 'package:portfolio/utils/statics/colors.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as math;
import 'dart:html' as html;

class ExperiencePageDesktop extends StatelessWidget {
  final ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    final loc = Localizations.of<LocaleBase>(context, LocaleBase);

    return Scrollbar(
        isAlwaysShown: true,
        controller: _scrollController,
        child: Stack(
          children: [
            _UpperWave(),
            Container(
              child: ListView(
                controller: _scrollController,
                children: <Widget>[
                  _Title(loc: loc),
                  _Legend(),
                  List(loc: loc),
                ],
              ),
            ),
          ],
        ));
  }
}

class List extends StatelessWidget {
  const List({
    Key key,
    @required this.loc,
  }) : super(key: key);

  final LocaleBase loc;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsets.only(
              top: 64.h, bottom: 64.h, left: 101.w, right: 101.w),
          child: Wrap(
            spacing: 173.w,
            runSpacing: 50.h,
            alignment: WrapAlignment.spaceBetween,
            children: [
              CardDesktop(
                color1: PortfolioColors.android,
                color2: PortfolioColors.android,
                image: AssetImage(ASSET_AIDER),
                title: loc.experience.aider,
                desc: loc.experience.aider_desc,
                onPress: () => html.window.open(
                    "https://play.google.com/store/apps/details?id=com.aider",
                    "aider"),
              ),
              CardDesktop(
                  color1: PortfolioColors.android,
                  color2: PortfolioColors.android,
                  image: AssetImage(ASSET_FINDAIR),
                  title: loc.experience.findair,
                  desc: loc.experience.findair_desc,
                  onPress: () => showProjectDialog(
                      context,
                      loc.experience.findair,
                      loc.experience.findair1,
                      loc.experience.findair2,
                      "https://findair.eu/products/findair-app.html")),
              CardDesktop(
                  color1: PortfolioColors.flutter,
                  color2: PortfolioColors.android,
                  image: AssetImage(ASSET_FINDAIR_RESEARCH),
                  title: "",
                  desc: loc.experience.findair_research_desc,
                  onPress: () => showProjectDialog(
                      context,
                      loc.experience.findair_research,
                      loc.experience.findair_r1,
                      loc.experience.findair_r2,
                      "https://findair.eu/products/findair-research-app.html")),
              CardDesktop(
                  color1: PortfolioColors.flutter,
                  color2: PortfolioColors.flutter,
                  image: AssetImage(ASSET_SANITY),
                  title: "",
                  desc: loc.experience.findair_research_desc,
                  onPress: () => showProjectDialog(
                      context,
                      loc.experience.sanity,
                      "",
                      loc.experience.sanity1,
                      "https://findair.eu/resources/case-studies/sanity/")),
              CardDesktop(
                color1: PortfolioColors.flutter,
                color2: PortfolioColors.flutter,
                image: AssetImage(ASSET_BMI),
                title: loc.experience.bmi_diary,
                desc: "BMI calcualtor and Diary made In Flutter",
                onPress: () => html.window
                    .open("https://github.com/DeNatur/bmi_diary", "github"),
              ),
              CardDesktop(
                color1: PortfolioColors.android,
                color2: PortfolioColors.android,
                image: AssetImage(ASSET_WA_CALCULATOR),
                title: "WA Calculator",
                desc: "Simple and intuitive weighted average calculator ",
                onPress: () => html.window.open(
                    "https://github.com/DeNatur/Weighted-Average-Calculator",
                    "github"),
              ),
              CardPorftolioDesktop(
                color1: PortfolioColors.flutter,
                color2: PortfolioColors.flutter,
                image: AssetImage(ASSET_PORTFOLIO),
                title: "Portfolio",
                onPress: () => html.window
                    .open("https://github.com/DeNatur/portfolio", "github"),
              ),
              CardDesktop(
                color1: PortfolioColors.flutter,
                color2: PortfolioColors.flutter,
                image: AssetImage(ASSET_DRINGO),
                title: "Dringo",
                desc: "Social app\nSoon on market!",
                onPress: () =>
                    html.window.open("https://dringo.app/", "dringo"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    Key key,
    @required this.loc,
  }) : super(key: key);

  final LocaleBase loc;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(
        top: 160.h,
        left: 101.w,
      ),
      child: Text(
        loc.experience.experience,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 56.sp,
            color: PortfolioColors.white),
      ),
    );
  }
}

class _Legend extends StatelessWidget {
  const _Legend({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 36.h,
        left: 101.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 88.w,
                alignment: Alignment.centerLeft,
                child: Text(
                  "Android",
                  style:
                      TextStyle(fontSize: 18.sp, color: PortfolioColors.white),
                ),
              ),
              Container(
                width: 20.h,
                height: 4.h,
                decoration: BoxDecoration(
                    color: PortfolioColors.android,
                    borderRadius: BorderRadius.circular(16)),
              )
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 88.w,
                alignment: Alignment.centerLeft,
                child: Text(
                  "Flutter",
                  style:
                      TextStyle(fontSize: 18.sp, color: PortfolioColors.white),
                ),
              ),
              Container(
                width: 20.h,
                height: 4.h,
                decoration: BoxDecoration(
                    color: PortfolioColors.flutter,
                    borderRadius: BorderRadius.circular(16)),
              )
            ],
          ),
        ],
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
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.rotationZ(math.pi),
      child: PlayAnimation(
        tween: Tween<Offset>(begin: Offset(0, 250.h), end: Offset(0, 100.h)),
        curve: Curves.easeInOutSine,
        builder: (context, child, Offset value) => Opacity(
            opacity: 1 - (value.dy / 250.h),
            child: Transform.translate(offset: value, child: child)),
        child: BlueWaves(),
      ),
    );
  }
}
