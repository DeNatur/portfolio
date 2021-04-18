import 'package:flutter/cupertino.dart';
import 'package:portfolio/ui/desktop/experience_page_desktop.dart';
import 'package:portfolio/ui/mobile/experience_mobile.dart';
import 'package:portfolio/ui/tablet/experience_tablet.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ExperiencePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: ExperiencePageMobile(),
      tablet: ExperiencePageTablet(),
      desktop: ExperiencePageDesktop(),
    );
  }
}
