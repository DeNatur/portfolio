import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/ui/desktop/top_bar_desktop.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../buisness_logic/providers.dart';
import '../../buisness_logic/view_models/main_viewmodel.dart';

class TopBar extends HookWidget {
  @override
  Widget build(BuildContext context) {
    PortfolioPage currentPage =
        useProvider<MainViewModel>(mainViewModel).currentPage;
    return ScreenTypeLayout(
      mobile: TopBarDesktop(currentPage: currentPage),
      tablet: TopBarDesktop(currentPage: currentPage),
      desktop: TopBarDesktop(currentPage: currentPage),
    );
  }
}
