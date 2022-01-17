import 'package:firebase_auth/firebase_auth.dart';
import 'package:ornek_proje/common/model/app_user.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  AppUser getCurrentUser() {
    return _firebaseAuth.currentUser == null
        ? null
        : _firebaseUserToAppUser(_firebaseAuth.currentUser);
  }

  AppUser _userFromFirebase(User user) {
    if (user == null) {
      return null;
    }
    return AppUser(userID: user.uid);
  }

  Future<bool> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return true;
    } catch (e) {
      print("SignOut Error" + e.toString());
      return false;
    }
  }

  Future<AppUser> signInAnonymously() async {
    try {
      UserCredential userC = await _firebaseAuth.signInAnonymously();
      User _user = userC.user;
      if (_user != null) {
        return _userFromFirebase(_user);
      } else {
        return null;
      }
    } catch (e) {
      print("singInAnonymously Error");
      return null;
    }
  }

  AppUser _firebaseUserToAppUser(User firebaseUser) {
    return AppUser(userID: firebaseUser.uid);
  }
}
