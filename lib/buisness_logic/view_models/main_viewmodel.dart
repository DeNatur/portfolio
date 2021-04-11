import 'package:flutter/widgets.dart';
import 'package:portfolio/buisness_logic/utils/view_model.dart';

enum PortfolioPage {
  Home,
  About,
  Experience,
  Contact,
}

class MainViewModel extends ViewModel {
  PortfolioPage currentPage = PortfolioPage.Home;

  void changePage(PortfolioPage page) {
    currentPage = page;
    notifyListeners();
  }
}
