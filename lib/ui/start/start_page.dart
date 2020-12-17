import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:portfolio/buisness_logic/view_models/start_viewmodel.dart';
import 'package:portfolio/services/service_locator.dart';
import 'package:portfolio/services/service_navigation.dart';
import 'package:portfolio/utils/statics/routes.dart';
import 'package:portfolio/utils/widgets/navbar.dart';
import 'package:portfolio/utils/widgets/radial_bg.dart';
import 'package:provider/provider.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<StartViewModel>(
      create: (context) => locator<StartViewModel>(),
      child: Scaffold(
        body: Stack(
          children: [
            RadialBg(),
            NavBar(
              index: 0,
              text: "START",
              onPressRight: () {
                locator<NavigationService>().navigateTo(ProjcetsViewRoute);
              },
            ),
          ],
        ),
      ),
    );
  }
}
