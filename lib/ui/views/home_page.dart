import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/ui/desktop/home_page_desktop.dart';
import 'package:portfolio/ui/mobile/home_page_mobile.dart';
import 'package:portfolio/ui/tablet/home_page_tablet.dart';

import 'package:responsive_builder/responsive_builder.dart';

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
