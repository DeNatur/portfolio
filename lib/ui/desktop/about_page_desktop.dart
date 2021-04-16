import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/generated/locale_base.dart';
import 'package:portfolio/ui/components/blue_waves.dart';
import 'package:portfolio/utils/statics/asset_names.dart';
import 'package:portfolio/utils/statics/colors.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class AboutPageDesktop extends StatelessWidget {
  final ScrollController _scrollController = new ScrollController();
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
              ],
            ),
          )
        ],
      ),
    );
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
