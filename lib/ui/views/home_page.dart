import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/ui/desktop/home_page_desktop.dart';
import 'package:portfolio/ui/mobile/home_page_mobile.dart';
import 'package:portfolio/ui/tablet/home_page_tablet.dart';
import 'package:portfolio/utils/statics/asset_names.dart';
import 'package:portfolio/utils/statics/colors.dart';
import 'package:portfolio/utils/widgets/crossplatform_svg.dart';
import 'package:portfolio/utils/widgets/moving_bg.dart';

import 'package:portfolio/utils/widgets/radial_bg.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:websafe_svg/websafe_svg.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: HomePageMobile(),
      tablet: HomePageTablet(),
      desktop: HomePageDesktop(),
    );
  }
}
