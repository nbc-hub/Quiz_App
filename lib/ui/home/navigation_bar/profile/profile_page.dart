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
                  style: TextStyle(fontSize: 150),
                ),
                Text(
                  "UserID : " + viewModel.appRepository.appUser.userID,
                  style: const TextStyle(fontSize: 32, color: Colors.black),
                ),
                const Text(
                  "",
                  style: TextStyle(fontSize: 150),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    "En Yüksek Puanın : " +
                        viewModel.appRepository.appUser.bestPoint.toString(),
                    style: const TextStyle(fontSize: 36, color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    "En Yüksek Tarih Puanın : " +
                        viewModel.appRepository.appUser.historyPoint.toString(),
                    style: const TextStyle(fontSize: 36, color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    "En Yüksek Genel Kültür Puanın : " +
                        viewModel.appRepository.appUser.culturePoint.toString(),
                    style: const TextStyle(fontSize: 36, color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    "En Yüksek Çoğrafya Puanın : " +
                        viewModel.appRepository.appUser.geographyPoint
                            .toString(),
                    style: const TextStyle(fontSize: 36, color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    "En Yüksek Müzik Puanın : " +
                        viewModel.appRepository.appUser.musicPoint.toString(),
                    style: const TextStyle(fontSize: 36, color: Colors.black),
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
