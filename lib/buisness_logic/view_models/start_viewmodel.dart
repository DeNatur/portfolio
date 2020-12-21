import 'package:portfolio/buisness_logic/view_models/projcets_viewmodel.dart';
import 'package:portfolio/utils/statics/routes.dart';
import 'package:portfolio/utils/viewmodel.dart';

class StartViewModel extends ViewModel {
  void navigateToProjects() {
    navigationService.navigateTo(ProjcetsViewRoute);
  }
}
