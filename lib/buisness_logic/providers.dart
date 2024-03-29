// Global variables for services
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/services/firebase_service.dart';
import 'package:portfolio/services/service_navigation.dart';

import 'view_models/main_viewmodel.dart';

final navigationProvider =
    Provider<NavigationService>((_) => NavigationService());

final mainViewModel =
    ChangeNotifierProvider<MainViewModel>((_) => MainViewModel());

final firebaseService =
    ChangeNotifierProvider<FirebaseService>((_) => FirebaseService());
