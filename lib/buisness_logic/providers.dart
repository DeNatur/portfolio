// Global variables for services
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/services/service_navigation.dart';

final navigationProvider =
    Provider<NavigationService>((_) => NavigationService());
