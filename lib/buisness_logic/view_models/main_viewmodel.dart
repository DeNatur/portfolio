import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/buisness_logic/utils/view_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';

enum PortfolioPage {
  Home,
  About,
  Experience,
  Contact,
}

class MainViewModel extends ViewModel {
  PortfolioPage currentPage = PortfolioPage.Home;
  PageController pageController = PageController();
  TextEditingController nameTEC = TextEditingController();
  TextEditingController emailTEC = TextEditingController();
  TextEditingController messageTEC = TextEditingController();

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

  void goToLinkedIn() {
    launch("https://www.linkedin.com/in/szymonstasik/");
  }

  void goToGithub() {
    launch("https://github.com/DeNatur");
  }

  void copyEmail() {
    Clipboard.setData(ClipboardData(text: "szymon.stasik1@gmail.com"));
    Fluttertoast.showToast(
        msg: "Email copied to clipboard!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black.withOpacity(0.4),
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void sendMessage() {
    //TODO implement send message
  }

  void seeResume() {
    launch(
        "https://drive.google.com/file/d/1YAv10byYr1SL6hbeAjLws7ePrNFVnkwZ/view?usp=sharing");
  }
}
