import 'package:flutter/foundation.dart';
import 'package:portfolio/services/service_locator.dart';
import 'package:portfolio/services/service_navigation.dart';

class ViewModel extends ChangeNotifier {
  final NavigationService navigationService = locator<NavigationService>();
}
