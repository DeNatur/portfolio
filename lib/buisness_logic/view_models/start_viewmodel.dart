import 'package:portfolio/buisness_logic/view_models/projcets_viewmodel.dart';
import 'package:portfolio/utils/statics/routes.dart';
import 'package:portfolio/utils/viewmodel.dart';
import 'dart:html' as html;

class StartViewModel extends ViewModel {
  void openGitHubPage() {
    html.window.open("https://github.com/DeNatur", "github");
  }

  void openFbPage() {
    html.window.open("https://www.facebook.com/szymon.stasik.10", "facebook");
  }

  void openLinkedInPage() {
    html.window.open("https://www.linkedin.com/in/szymonstasik", "facebook");
  }

  void navigateToProjects() {
    navigationService.navigateTo(ProjcetsViewRoute);
  }
}
