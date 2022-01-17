import 'dart:math';
import 'package:flutter/material.dart';

class AppUser {
  String userID;
  String email;
  String userName;
  String profileUrl;
  int historyPoint;
  int geographyPoint;
  int culturePoint;
  int musicPoint;
  int bestPoint;

  AppUser({@required this.userID});

  Map<String, dynamic> toMap() {
    return {
      'userID': userID,
      'email': email ?? "ziyaretci@email.com",
      'userName': userName ?? userID + randomNumber(),
      'historyPoint': historyPoint ?? 0,
      'geographyPoint': historyPoint ?? 0,
      'culturePoint': culturePoint ?? 0,
      'musicPoint': musicPoint ?? 0,
      'bestPoint': bestPoint ?? 0,
    };
  }

  AppUser.fromMap(Map<String, dynamic> map)
      : userID = map['userID'],
        email = map['email'],
        userName = map['userName'],
        profileUrl = map['profileUrl'],
        historyPoint = map['historyPoint'],
        geographyPoint = map['geographyPoint'],
        culturePoint = map['culturePoint'],
        musicPoint = map['musicPoint'],
        bestPoint = map['bestPoint'];

  @override
  String toString() {
    return 'AppUser{userID: $userID, email: $email, userName: $userName, profileUrl: $profileUrl, historyPoint: $historyPoint,geographyPoint: $geographyPoint,culturePoint: $culturePoint,musicPoint: $musicPoint,bestPoint: $bestPoint}';
  }

  String randomNumber() {
    int randomNumber = Random().nextInt(9999);
    return randomNumber.toString();
  }
}
