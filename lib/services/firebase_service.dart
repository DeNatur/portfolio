import 'package:firebase_core/firebase_core.dart';
import 'package:portfolio/buisness_logic/utils/view_model.dart';

class FirebaseService extends ViewModel {
  bool _error = false, _initialized = false;
  bool get error => _error;
  bool get initialized => _initialized;

  FirebaseService() {
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
