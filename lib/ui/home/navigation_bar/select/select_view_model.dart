import 'package:flutter/material.dart';
import 'package:ornek_proje/core/base/modelview/base_view_model.dart';
import 'package:ornek_proje/core/constants/router_constants.dart';

class SelectViewModel extends BaseViewModel {
  bool isInit = false;
  @override
  void init() {
    isInit = true;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void setContext(BuildContext context) {
    this.context = context;
  }

  void goPage(int categoryID) async {
    appRepository.setCategoryID(categoryID);
    navigationService.pushNamed(RouteConstant.QUIZ_PAGE_ROUTE);
  }
}
