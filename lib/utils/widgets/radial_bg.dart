import 'package:flutter/material.dart';
import 'package:portfolio/utils/statics/colors.dart';

import '../statics/colors.dart';

class RadialBg extends StatelessWidget {
  const RadialBg({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: RadialGradient(radius: 1.0, colors: [
        PortfolioColors.radialBgStart,
        PortfolioColors.radialBgEnd
      ])),
    );
  }
}
