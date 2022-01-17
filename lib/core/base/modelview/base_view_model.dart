import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ornek_proje/common/model/app_user.dart';
import 'package:ornek_proje/common/model/question/question_model.dart';
import 'package:ornek_proje/common/repository/app_repository.dart';
import 'package:ornek_proje/core/constants/app_constants.dart';
import 'package:ornek_proje/core/constants/asset_constants.dart';
import 'package:ornek_proje/core/navigation/navigation_service.dart';

import '../../../get_it.dart';

abstract class BaseViewModel extends ChangeNotifier {
  BuildContext context;
  bool _isLoading = false;

  final AppRepository appRepository = getIt<AppRepository>();
  final AssetContants assetContants = AssetContants.instance;
  final AppConstants appConstants = AppConstants.instance;

  final NavigationService navigationService = NavigationService.instance;

  set isLoadingSet(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  set setUser(AppUser appUser) => appRepository.appUser = appUser;
  set setQuestionModel(QuestionModel questionModel) =>
      appRepository.questionModel = questionModel;
  int get categoryID => appRepository.categoryID;
  bool get isLoading => _isLoading;
  AppUser get appUser => appRepository.appUser;
  QuestionModel get questionModel => appRepository.questionModel;
  void init();

  void setState() {
    notifyListeners();
  }

  void setContext(BuildContext context) {
    this.context = context;
  }

  void showToast(String message) async {
    await Fluttertoast.showToast(msg: message);
  }

  void showSnackBar(String message) async {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Colors.white,
      behavior: SnackBarBehavior.floating,
    ));
  }
}
