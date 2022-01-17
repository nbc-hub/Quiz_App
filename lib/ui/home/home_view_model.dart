import 'package:flutter/material.dart';
import 'package:ornek_proje/core/base/modelview/base_view_model.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class HomeViewModel extends BaseViewModel {
  int page;
  PersistentTabController controller;

  HomeViewModel(this.page);

  @override
  void init() {
    page = page ?? 0;
    PersistentTabController(initialIndex: page);
  }

  @override
  void setContext(BuildContext context) {
    this.context = context;
  }
}
