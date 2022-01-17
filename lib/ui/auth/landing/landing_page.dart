import 'package:flutter/material.dart';
import 'package:ornek_proje/core/base/view/base_view.dart';
import 'package:ornek_proje/ui/auth/landing/landing_view_model.dart';
import 'package:ornek_proje/ui/auth/login/login_page.dart';
import 'package:ornek_proje/ui/home/home_page.dart';

class LandingPage extends StatelessWidget {
  final int homeIndex;
  const LandingPage({Key key, this.homeIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LandingViewModel>(
        viewModel: LandingViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (BuildContext context, LandingViewModel viewModel) {
          if (viewModel.isLoading == true) {
            return const Scaffold(body: CircularProgressIndicator());
          } else {
            if (viewModel.appUser == null) {
              return LoginPage();
            } else {
              return HomePage();
            }
          }
        });
  }
}
