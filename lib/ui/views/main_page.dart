import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/buisness_logic/providers.dart';
import 'package:portfolio/ui/components/drawer.dart';
import 'package:portfolio/ui/views/about_page.dart';
import 'package:portfolio/ui/views/contact_page.dart';
import 'package:portfolio/ui/views/home_page.dart';
import 'package:portfolio/ui/views/top_bar.dart';
import 'package:portfolio/utils/statics/asset_names.dart';
import 'package:portfolio/utils/statics/colors.dart';
import 'package:portfolio/utils/widgets/screen_type_util.dart';

import 'experience_page.dart';
import 'navigation_arrows.dart';

class MainPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.setAppropiateScreenType(context);
    return Scaffold(
      backgroundColor: PortfolioColors.radialBgEnd,
      drawer: MainPageDrawer(),
      body: Stack(
        children: [
          PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: useProvider(mainViewModel).pageController,
            children: [
              HomePage(),
              AboutPage(),
              ExperiencePage(),
              ContactPage(),
            ],
          ),
          TopBar(),
          NavigationArrows(),
        ],
      ),
    );
  }
}
