import 'package:flutter/widgets.dart';
import 'package:portfolio/ui/desktop/top_bar_desktop.dart';
import 'package:portfolio/ui/mobile/top_bar_mobile.dart';
import 'package:portfolio/ui/tablet/top_bar_tablet.dart';
import 'package:responsive_builder/responsive_builder.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: TopBarMobile(),
      tablet: TopBaTablet(),
      desktop: TopBarDesktop(),
    );
  }
}
