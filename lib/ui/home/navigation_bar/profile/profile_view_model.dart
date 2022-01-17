import 'package:flutter/material.dart';
import 'package:ornek_proje/core/base/modelview/base_view_model.dart';
import 'package:ornek_proje/core/constants/router_constants.dart';

class ProfileViewModel extends BaseViewModel {
  @override
  void init() {}
  @override
  void setContext(BuildContext context) {
    this.context = context;
  }

  Future<void> signOut() async {
    try {
      await appRepository.signOut();
      await navigationService
          .pushNamedAndRemoveUntil(RouteConstant.LANDING_PAGE_ROUTE);
    } catch (e) {
      showSnackBar('Bir hata oluştu');
    }
  }
}
