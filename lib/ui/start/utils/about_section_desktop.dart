import 'package:flutter/material.dart';
import 'package:portfolio/buisness_logic/view_models/start_viewmodel.dart';
import 'package:portfolio/ui/components/icon_image_button.dart';
import 'package:portfolio/ui/components/stroke_button.dart';
import 'package:portfolio/ui/start/utils/icon_row.dart';
import 'package:portfolio/utils/statics/colors.dart';
import 'package:portfolio/utils/widgets/centered_view.dart';
import 'package:provider/provider.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:portfolio/utils/widgets/web_extensions.dart';

class AboutSectionDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CenteredView(
      child: Stack(
        children: [
          IconContactRow(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildMobileImage(),
              Align(
                alignment: Alignment.centerRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildMobileDeveloperText(),
                    _buildStasikText(),
                    _buildStasikSubtext(),
                    _buildSeeProjectsButton()
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Consumer<StartViewModel> _buildSeeProjectsButton() {
    return Consumer<StartViewModel>(
      builder: (context, model, child) => StrokeButton(
        margin: EdgeInsets.only(top: 72),
        text: "See my projects",
        onPressed: model.navigateToProjects,
      ),
    );
  }

  PlayAnimation<Offset> _buildStasikSubtext() {
    return PlayAnimation(
      tween: Tween<Offset>(begin: Offset(1000, 0), end: Offset.zero),
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
              color: Colors.white, fontWeight: FontWeight.w300, fontSize: 16),
        ),
      ),
    );
  }

  PlayAnimation<Offset> _buildStasikText() {
    return PlayAnimation(
      tween: Tween<Offset>(begin: Offset(1000, 0), end: Offset.zero),
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
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 54),
        ),
      ),
    );
  }

  PlayAnimation<Offset> _buildMobileDeveloperText() {
    return PlayAnimation(
      tween: Tween<Offset>(begin: Offset(1000, 0), end: Offset.zero),
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
            color: color_light_blue, fontWeight: FontWeight.bold, fontSize: 32),
      ),
    );
  }

  Align _buildMobileImage() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Image.asset(
        "assets/images/mobile.png",
        fit: BoxFit.contain,
      ),
    );
  }
}
