import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/buisness_logic/utils/utils.dart';
import 'package:portfolio/buisness_logic/utils/view_model.dart';
import 'package:portfolio/services/cloud_service.dart';
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
    launch("https://www.linkedin.com/in/sstasik/");
  }

  void goToFaceBook() {
    launch("https://www.linkedin.com/in/sstasik/");
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

  void sendMessage() async {
    if (busy) return;
    setBusy(true);
    String email = emailTEC.text;
    String name = nameTEC.text;
    String message = messageTEC.text;
    if (!_validateInputs(email, name, message)) {
      setBusy(false);
      return;
    }
    bool result = await CloudService.sendEmail(email, name, message);
    setBusy(false);

    _showMessageResults(result);
  }

  void _showMessageResults(bool result) {
    if (result) {
      Fluttertoast.showToast(
          msg: "Message was sent successfully!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black.withOpacity(0.4),
          textColor: Colors.white,
          fontSize: 16.0);
      nameTEC.text = "";
      emailTEC.text = "";
      messageTEC.text = "";
      return;
    }
    Fluttertoast.showToast(
        msg: "Something went wrong with sending message!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black.withOpacity(0.4),
        textColor: Colors.white,
        fontSize: 16.0);
  }

  bool _validateInputs(String email, String name, String message) {
    if (!_validateMail(email)) return false;
    if (!_validateName(name)) return false;
    if (!_validateMessage(message)) return false;
    return true;
  }

  bool _validateMessage(String message) {
    if (message.isEmpty) {
      Fluttertoast.showToast(
          msg: "Message cannot be empty!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black.withOpacity(0.4),
          textColor: Colors.white,
          fontSize: 16.0);
      return false;
    }
    return true;
  }

  bool _validateName(String name) {
    if (name.isEmpty) {
      Fluttertoast.showToast(
          msg: "Name cannot be empty!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black.withOpacity(0.4),
          textColor: Colors.white,
          fontSize: 16.0);
      return false;
    }
    return true;
  }

  bool _validateMail(String email) {
    if (email.isEmpty || !Utils.validateMail(email)) {
      Fluttertoast.showToast(
          msg: "Wrong Email!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black.withOpacity(0.4),
          textColor: Colors.white,
          fontSize: 16.0);
      return false;
    }
    return true;
  }

  void seeResume() {
    launch(
        "https://drive.google.com/file/d/1YAv10byYr1SL6hbeAjLws7ePrNFVnkwZ/view?usp=sharing");
  }
}
