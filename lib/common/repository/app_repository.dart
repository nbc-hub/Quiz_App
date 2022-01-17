import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:ornek_proje/common/model/app_user.dart';
import 'package:ornek_proje/common/model/question/question_model.dart';
import 'package:ornek_proje/common/services/firebase_auth_service.dart';
import 'package:ornek_proje/common/services/firebase_firestore_service.dart';
import 'package:ornek_proje/get_it.dart';

class AppRepository {
  final FirebaseAuthService _firebaseAuthService = getIt<FirebaseAuthService>();
  final FirebaseFirestoreService _firebaseFirestoreService =
      getIt<FirebaseFirestoreService>();

  AppUser appUser;
  QuestionModel questionModel;
  int categoryID = 1;

  Future<void> currentUser() async {
    var appUserFB = _firebaseAuthService.getCurrentUser();
    if (appUserFB != null) {
      var appUserDB = await readUserFromDatabase(appUserFB.userID);
      if (appUserDB != null) {
        appUser = appUserDB;
      }
    }
  }

  void setCategoryID(int categoryID) {
    this.categoryID = categoryID;
  }

  Future<void> signOut() async {
    appUser = null;
    await _firebaseAuthService.signOut();
  }

  /////////////////////////////////////   Firestore   ///////////////////////////////////////////////

  Future<bool> signInAnonymously(AppUser user) async {
    var userDB = await _firebaseAuthService.signInAnonymously();
    if (userDB != null) {
      user.userID = userDB.userID;
      await _firebaseFirestoreService.saveUserToDatabase(userDB);
      appUser = userDB;
      return true;
    } else {
      return false;
    }
  }

  Future<bool> readQuestionModel(
      String categoryName, String questionIndex) async {
    var newQuestionModel = await _firebaseFirestoreService.readQuestionModel(
        categoryName, questionIndex);
    if (newQuestionModel != null) {
      questionModel = newQuestionModel;
      return true;
    }
    return false;
  }

  Future<void> updateBestPoint(int bestPoint) async {
    appUser.bestPoint = bestPoint;
    return await _firebaseFirestoreService.updateBestPoint(
        appUser.bestPoint, appUser.userID);
  }

  Future<void> updateCategoryPoint(
      String categoryName, int categoryPoint) async {
    String categoryNamePoint = "";
    if (categoryName == "culturequestions") {
      appUser.culturePoint = categoryPoint;
      categoryNamePoint = "culturePoint";
    } else if (categoryName == "geographyquestions") {
      appUser.geographyPoint = categoryPoint;
      categoryNamePoint = "geographyPoint";
    } else if (categoryName == "musicquestions") {
      appUser.musicPoint = categoryPoint;
      categoryNamePoint = "musicPoint";
    } else if (categoryName == "historyquestions") {
      appUser.historyPoint = categoryPoint;
      categoryNamePoint = "historyPoint";
    }
    return await _firebaseFirestoreService.updateCategoryPoint(
        categoryNamePoint, categoryPoint, appUser.userID);
  }

  Future<bool> saveUserToDatabase(AppUser appUser) async {
    return await _firebaseFirestoreService.saveUserToDatabase(appUser);
  }

  Future<AppUser> readUserFromDatabase(String userID) async {
    return await _firebaseFirestoreService.readUserFromDatabase(userID);
  }
}
