import 'package:flutter/cupertino.dart';
import 'package:portfolio/utils/statics/colors.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MobileBlueWaves extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WaveWidget(
      config: CustomConfig(
        gradients: [
          [PortfolioColors.wave1, PortfolioColors.wave1.withOpacity(0.0)],
          [PortfolioColors.wave1, PortfolioColors.wave2.withOpacity(0.0)],
          [PortfolioColors.wave1, PortfolioColors.wave3.withOpacity(0.0)],
        ],
        durations: [35000, 19440, 10800],
        heightPercentages: [0.3, 0.4, 0.5],
        blur: MaskFilter.blur(BlurStyle.solid, 10),
        gradientBegin: Alignment.topCenter,
        gradientEnd: Alignment.bottomCenter,
      ),
      waveAmplitude: 20,
      size: Size(
        double.infinity,
        56.h,
      ),
    );
  }
}

class BlueWaves extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WaveWidget(
      config: CustomConfig(
        gradients: [
          [PortfolioColors.wave1, PortfolioColors.wave1.withOpacity(0.0)],
          [PortfolioColors.wave1, PortfolioColors.wave2.withOpacity(0.0)],
          [PortfolioColors.wave1, PortfolioColors.wave3.withOpacity(0.0)],
        ],
        durations: [35000, 19440, 10800],
        heightPercentages: [0.3, 0.4, 0.5],
        blur: MaskFilter.blur(BlurStyle.solid, 10),
        gradientBegin: Alignment.topCenter,
        gradientEnd: Alignment.bottomCenter,
      ),
      waveAmplitude: 20,
      size: Size(
        double.infinity,
        342.h,
      ),
    );
  }
}
