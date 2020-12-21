import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:portfolio/buisness_logic/view_models/start_viewmodel.dart';
import 'package:portfolio/services/service_locator.dart';
import 'package:portfolio/services/service_navigation.dart';
import 'package:portfolio/ui/start/utils/about_section_desktop.dart';
import 'package:portfolio/ui/start/utils/about_section_mobile.dart';
import 'package:portfolio/ui/start/utils/about_section_tablet.dart';
import 'package:portfolio/utils/widgets/navbar.dart';
import 'package:portfolio/utils/widgets/radial_bg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<StartViewModel>(
      create: (context) => locator<StartViewModel>(),
      child: Scaffold(
        body: Stack(
          children: [
            RadialBg(),
            ScreenTypeLayout(
              desktop: AboutSectionDesktop(),
              tablet: AboutSectionTablet(),
              mobile: AboutSectionMobile(),
            ),
            Consumer<StartViewModel>(
              builder: (context, model, child) => NavBar(
                index: 0,
                text: "START",
                onPressRight: () => model.navigateToProjects(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
