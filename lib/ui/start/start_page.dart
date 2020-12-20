import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:portfolio/buisness_logic/view_models/start_viewmodel.dart';
import 'package:portfolio/services/service_locator.dart';
import 'package:portfolio/services/service_navigation.dart';
import 'package:portfolio/utils/statics/colors.dart';
import 'package:portfolio/utils/statics/routes.dart';
import 'package:portfolio/utils/widgets/centered_view.dart';
import 'package:portfolio/utils/widgets/navbar.dart';
import 'package:portfolio/utils/widgets/radial_bg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:portfolio/utils/widgets/web_extensions.dart';

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
              tablet: AboutSectionDesktop(),
              mobile: AboutSectionDesktop(),
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

class AboutSectionDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<StartViewModel>(
      builder: (context, model, child) {
        return CenteredView(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: ImageIcon(
                        AssetImage("assets/images/github.png"),
                        color: Colors.white,
                      ),
                      onPressed: () => model.openGitHubPage(),
                    ).showCursorOnHover.moveUpOnHover,
                    SizedBox(
                      width: 24,
                    ),
                    IconButton(
                      icon: ImageIcon(
                        AssetImage("assets/images/fb.png"),
                        color: Colors.white,
                      ),
                      onPressed: () => model.openFbPage(),
                    ).showCursorOnHover.moveUpOnHover,
                    SizedBox(
                      width: 24,
                    ),
                    IconButton(
                      icon: ImageIcon(
                        AssetImage("assets/images/linkedin.png"),
                        color: Colors.white,
                      ),
                      onPressed: () => model.openLinkedInPage(),
                    ).showCursorOnHover.moveUpOnHover,
                    SizedBox(
                      width: 24,
                    ),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset(
                      "assets/images/mobile.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PlayAnimation(
                          tween: Tween<Offset>(
                              begin: Offset(1000, 0), end: Offset.zero),
                          duration: Duration(milliseconds: 600),
                          curve: Curves.easeInOutSine,
                          builder: (context, child, value) {
                            return Transform.translate(
                              offset: value,
                              child: child,
                            );
                          },
                          child: Text(
                            "Mobile Developer",
                            style: TextStyle(
                                color: color_light_blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 32),
                          ),
                        ),
                        PlayAnimation(
                          tween: Tween<Offset>(
                              begin: Offset(1000, 0), end: Offset.zero),
                          delay: Duration(milliseconds: 300),
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeInOutSine,
                          builder: (context, child, value) {
                            return Transform.translate(
                              offset: value,
                              child: child,
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: Text(
                              "SZYMON STASIK",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 54),
                            ),
                          ),
                        ),
                        PlayAnimation(
                          tween: Tween<Offset>(
                              begin: Offset(1000, 0), end: Offset.zero),
                          delay: Duration(milliseconds: 600),
                          duration: Duration(milliseconds: 400),
                          curve: Curves.easeInOutSine,
                          builder: (context, child, value) {
                            return Transform.translate(
                              offset: value,
                              child: child,
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 24.0),
                            child: Text(
                              "Hi! I am Mobile Developer with 2 years of\ncommercial experience",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 16),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 72),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 3, color: color_ultra_light_blue)),
                          child: MaterialButton(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24, vertical: 16),
                            child: Center(
                              child: Text(
                                "See my projects",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: color_ultra_light_blue),
                              ),
                            ),
                            onPressed: () {
                              locator<NavigationService>()
                                  .navigateTo(ProjcetsViewRoute);
                            },
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
