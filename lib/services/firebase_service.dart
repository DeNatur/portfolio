import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:portfolio/buisness_logic/utils/view_model.dart';
import 'package:portfolio/utils/statics/asset_names.dart';

class FirebaseService extends ViewModel {
  bool _error = false, _initialized = false;
  bool get error => _error;
  bool get initialized => _initialized;

  FirebaseService() {
    if (DEBUG) {
      log("message");
      return;
    }
    try {
      Firebase.initializeApp().then((value) {
        _initialized = true;
        notifyListeners();
      });
    } catch (e) {
      _error = true;
      notifyListeners();
    }
  }
}
