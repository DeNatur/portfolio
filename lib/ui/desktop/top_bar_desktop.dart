import 'package:flutter/widgets.dart';
import 'package:portfolio/ui/components/top_tile.dart';

import '../../buisness_logic/view_models/main_viewmodel.dart';
import '../../buisness_logic/view_models/main_viewmodel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopBarDesktop extends StatelessWidget {
  final PortfolioPage currentPage;

  const TopBarDesktop({Key key, @required this.currentPage}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        margin: EdgeInsets.only(top: 56.h, right: 100.w),
        alignment: Alignment.topRight,
        child: Row(
          children: [
            TopTile(
              text: "Home",
              current: currentPage == PortfolioPage.Home,
              onPressed: () {},
            ),
            TopTile(
              text: "About",
              current: currentPage == PortfolioPage.About,
              onPressed: () {},
            ),
            TopTile(
              text: "Experience",
              current: currentPage == PortfolioPage.Experience,
              onPressed: () {},
            ),
            TopTile(
              text: "Contact",
              current: currentPage == PortfolioPage.Contact,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
