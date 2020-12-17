import 'package:get_it/get_it.dart';
import 'package:portfolio/buisness_logic/view_models/projcets_viewmodel.dart';
import 'package:portfolio/buisness_logic/view_models/start_viewmodel.dart';
import 'package:portfolio/services/service_navigation.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
  locator.registerFactory<StartViewModel>(() => StartViewModel());
  locator.registerFactory<ProjcetsViewModel>(() => ProjcetsViewModel());
}
