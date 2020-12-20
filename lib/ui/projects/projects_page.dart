import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:portfolio/buisness_logic/view_models/projcets_viewmodel.dart';
import 'package:portfolio/services/service_locator.dart';
import 'package:portfolio/services/service_navigation.dart';
import 'package:portfolio/utils/statics/colors.dart';
import 'package:portfolio/utils/statics/routes.dart';
import 'package:portfolio/utils/widgets/crossplatform_svg.dart';
import 'package:portfolio/utils/widgets/navbar.dart';
import 'package:provider/provider.dart';
import 'package:simple_animations/simple_animations.dart';

class ProjectsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProjcetsViewModel>(
      create: (context) => locator<ProjcetsViewModel>(),
      child: Scaffold(
        backgroundColor: color_radial_bg_end,
        body: Stack(
          children: [
            PlayAnimation(
              tween: Tween<Offset>(begin: Offset(0, 200), end: Offset.zero),
              duration: Duration(milliseconds: 600),
              curve: Curves.easeInOutSine,
              builder: (context, child, value) {
                return Transform.translate(
                  offset: value,
                  child: child,
                );
              },
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset("assets/images/city_lower.png",
                    width: double.infinity,
                    alignment: Alignment.bottomCenter,
                    fit: BoxFit.fitWidth),
              ),
            ),
            PlayAnimation(
              tween: Tween<Offset>(begin: Offset(0, 200), end: Offset.zero),
              curve: Curves.easeInOutSine,
              duration: Duration(milliseconds: 600),
              delay: Duration(milliseconds: 200),
              builder: (context, child, value) {
                return Transform.translate(
                  offset: value,
                  child: child,
                );
              },
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset("assets/images/city_upper.png",
                    width: double.infinity,
                    alignment: Alignment.bottomCenter,
                    fit: BoxFit.fitWidth),
              ),
            ),
            NavBar(
              index: 2,
              text: "PROJECTS",
              onPressLeft: () {
                locator<NavigationService>().navigateTo(StartViewRoute);
              },
            ),
          ],
        ),
      ),
    );
  }
}
