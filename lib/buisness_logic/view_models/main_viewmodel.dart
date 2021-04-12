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
  PageController pageController = PageController();
  void changePage(PortfolioPage page) {
    currentPage = page;
    pageController.animateToPage(page.index,
        duration: Duration(milliseconds: 400), curve: Curves.easeInOutSine);
    notifyListeners();
  }

  void nextPage() {
    if (currentPage.index + 1 < PortfolioPage.values.length) {
      changePage(PortfolioPage.values[currentPage.index + 1]);
    }
  }

  void previousPage() {
    if (currentPage.index - 1 >= 0) {
      changePage(PortfolioPage.values[currentPage.index - 1]);
    }
  }
}
