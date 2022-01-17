import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ornek_proje/common/model/app_user.dart';
import 'package:ornek_proje/common/model/question/question_model.dart';

class FirebaseFirestoreService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<bool> saveUserToDatabase(AppUser appUser) async {
    try {
      await _firebaseFirestore
          .collection("users")
          .doc(appUser.userID)
          .set(appUser.toMap());
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<AppUser> readUserFromDatabase(String userID) async {
    try {
      var _documentSnapshot =
          await _firebaseFirestore.collection("users").doc(userID).get();
      var _userMap = _documentSnapshot.data();
      if (_userMap == null) {
        return null;
      } else {
        return AppUser.fromMap(_userMap);
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> saveOrReadUser(String userID) async {
    try {
      var _documentSnapshot =
          await _firebaseFirestore.collection("users").doc(userID).get();
      if (!_documentSnapshot.exists) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> updateBestPoint(int bestPoint, String userID) async {
    return await _firebaseFirestore
        .collection("users")
        .doc(userID)
        .update({'bestPoint': bestPoint});
  }

  Future<void> updateCategoryPoint(
      String categoryName, int categoryPoint, String userID) async {
    return await _firebaseFirestore
        .collection("users")
        .doc(userID)
        .update({categoryName: categoryPoint});
  }

  Future<QuestionModel> readQuestionModel(
      String categoryName, String questionIndex) async {
    DocumentSnapshot documentSnapshot = await _firebaseFirestore
        .collection(categoryName)
        .doc((questionIndex))
        .get();
    return QuestionModel.fromMap(documentSnapshot.data());
  }
}
