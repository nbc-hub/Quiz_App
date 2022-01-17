import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:ornek_proje/core/base/view/base_view.dart';
import 'package:ornek_proje/ui/home/navigation_bar/profile/profile_view_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileViewModel>(
      viewModel: ProfileViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, ProfileViewModel viewModel) {
        return Scaffold(
          backgroundColor: Colors.orangeAccent,
          body: Center(
            child: Column(
              children: [
                const Text(
                  "",
                  style: TextStyle(fontSize: 200),
                ),
                Text(
                  "UserID : " + viewModel.appRepository.appUser.userID,
                  style: const TextStyle(fontSize: 32),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    "Best Point : " +
                        viewModel.appRepository.appUser.bestPoint.toString(),
                    style: const TextStyle(fontSize: 36),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    "Culture Point : " +
                        viewModel.appRepository.appUser.culturePoint.toString(),
                    style: const TextStyle(fontSize: 36),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    "Geography Point : " +
                        viewModel.appRepository.appUser.geographyPoint
                            .toString(),
                    style: const TextStyle(fontSize: 36),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    "Music Point : " +
                        viewModel.appRepository.appUser.musicPoint.toString(),
                    style: const TextStyle(fontSize: 36),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
/*
  Future<void> _logOut(
      BuildContext context, ProfileViewModel profileViewModel) async {
    await profileViewModel.signOut();
  }

  Future _logOutConfirmation(
      BuildContext context, ProfileViewModel profileViewModel) async {
    final value = await PlatformResponsiveAlertDialog(
            title: "Emin Misiniz?",
            content: "Çıkmak istediğinizden emin misiniz?",
            mainButtonText: "Evet",
            subButtonText: "Vazgeç")
        .showPlatformDialog(context);

    if (value) {
      _logOut(context, profileViewModel);
    }
  }
*/

}
