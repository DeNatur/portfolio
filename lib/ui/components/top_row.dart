import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/buisness_logic/providers.dart';
import 'package:portfolio/buisness_logic/view_models/main_viewmodel.dart';
import 'package:portfolio/ui/components/top_tile.dart';

class TopRow extends HookWidget {
  @override
  Widget build(BuildContext context) {
    MainViewModel model = useProvider<MainViewModel>(mainViewModel);
    PortfolioPage currentPage = model.currentPage;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TopTile(
          text: "Home",
          current: currentPage == PortfolioPage.Home,
          onPressed: () {
            model.changePage(PortfolioPage.Home);
          },
        ),
        TopTile(
          text: "About",
          current: currentPage == PortfolioPage.About,
          onPressed: () {
            model.changePage(PortfolioPage.About);
          },
        ),
        TopTile(
          text: "Experience",
          current: currentPage == PortfolioPage.Experience,
          onPressed: () {
            model.changePage(PortfolioPage.Experience);
          },
        ),
        TopTile(
          text: "Contact",
          current: currentPage == PortfolioPage.Contact,
          onPressed: () {
            model.changePage(PortfolioPage.Contact);
          },
        ),
      ],
    );
  }
}
