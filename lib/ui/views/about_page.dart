import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/ui/desktop/about_page_desktop.dart';
import 'package:portfolio/ui/mobile/about_section_mobile.dart';
import 'package:portfolio/ui/tablet/about_section_tablet.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: AboutPageMobile(),
      tablet: AboutPageTablet(),
      desktop: AboutPageDesktop(),
    );
  }
}
