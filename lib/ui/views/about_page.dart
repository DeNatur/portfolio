import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/ui/desktop/about_page_desktop.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: AboutPageDesktop(),
      tablet: AboutPageDesktop(),
      desktop: AboutPageDesktop(),
    );
  }
}
