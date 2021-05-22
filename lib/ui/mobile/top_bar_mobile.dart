import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/buisness_logic/providers.dart';
import 'package:portfolio/buisness_logic/view_models/main_viewmodel.dart';
import 'package:portfolio/utils/statics/colors.dart';

class TopBarMobile extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    MainViewModel model = useProvider<MainViewModel>(mainViewModel);
    PortfolioPage currentPage = model.currentPage;
    String currentPageTitle = "";
    switch (currentPage) {
      case PortfolioPage.Home:
        currentPageTitle = "Home";
        break;
      case PortfolioPage.About:
        currentPageTitle = "About";
        break;
      case PortfolioPage.Experience:
        currentPageTitle = "Experience";

        break;
      case PortfolioPage.Contact:
        currentPageTitle = "Contact";
        break;
    }
    return Stack(
      children: [
        ClipRRect(
          child: Container(
            height: 64 + topPadding,
            child: BackdropFilter(
              filter: new ImageFilter.blur(sigmaX: 16.0, sigmaY: 16.0),
              child: Container(
                height: 64 + topPadding,
                color: PortfolioColors.linearBgEnd.withOpacity(0.2),
              ),
            ),
          ),
        ),
        Container(
          height: 56 + topPadding,
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 8.h + topPadding, left: 12, right: 16),
          child: Stack(
            children: [
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: Scaffold.of(context).openDrawer,
                color: PortfolioColors.white,
              ),
              Container(
                margin: EdgeInsets.only(top: 12),
                alignment: Alignment.topCenter,
                child: Text(
                  currentPageTitle,
                  style: TextStyle(
                      color: PortfolioColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container()
            ],
          ),
        ),
      ],
    );
  }
}
