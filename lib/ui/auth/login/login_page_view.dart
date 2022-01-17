import 'package:flutter/material.dart';
import 'package:ornek_proje/common/model/app_user.dart';
import 'package:ornek_proje/core/base/modelview/base_view_model.dart';
import 'package:ornek_proje/core/constants/router_constants.dart';

class LoginViewModel extends BaseViewModel {
  String email, userID;
  GlobalKey<FormState> formKey;
  @override
  void init() {
    formKey = GlobalKey<FormState>();
  }

  @override
  void setContext(BuildContext context) {
    this.context = context;
  }

  Future<void> goHomePage() async {
    await navigationService.pushNamed(RouteConstant.HOME_PAGE_ROUTE);
  }

  Future<void> signAnonymously() async {
    try {
      isLoadingSet = true;
      try {
        var tempAppUser = AppUser(userID: userID);
        var result = await appRepository.signInAnonymously(tempAppUser);
        if (result) {
          await navigationService
              .pushNamedAndRemoveUntil(RouteConstant.HOME_PAGE_ROUTE);
        } else {
          showSnackBar('Bir hata oluştu');
        }
      } catch (e) {
        showSnackBar(e.toString());
      }
    } finally {
      isLoadingSet = false;
    }
  }
/*
  Future<void> singInWithGoogle() async {
    try {
      isLoadingSet = true;
      try {
        var tempAppUser = AppUser(userID: userID, email: email);
        var result = await appRepository.singInWithGoogle(tempAppUser);
        if (result) {
          await navigationService
              .pushNamedAndRemoveUntil(RouteConstant.HOME_PAGE_ROUTE);
        } else {
          showSnackBar('Bir hata oluştu');
        }
      } catch (e) {
        showSnackBar(e.toString());
      }
    } finally {
      isLoadingSet = false;
    }
  }

  Future<void> facebookLogin() async {
    try {
      isLoadingSet = true;
      try {
        var tempAppUser = AppUser(userID: userID, email: email);
        var result = await appRepository.singInWithFacebook(tempAppUser);
        if (result) {
          await navigationService
              .pushNamedAndRemoveUntil(RouteConstant.HOME_PAGE_ROUTE);
        } else {
          showSnackBar('Bir hata oluştu');
        }
      } catch (e) {
        showSnackBar(e.toString());
      }
    } finally {
      isLoadingSet = false;
    }
  }
*/
}
