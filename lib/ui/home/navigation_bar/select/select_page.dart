import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ornek_proje/core/base/view/base_view.dart';
import 'package:ornek_proje/ui/home/navigation_bar/select/select_view_model.dart';

class SelectPage extends StatelessWidget {
  const SelectPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SelectViewModel>(
        viewModel: SelectViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (BuildContext context, SelectViewModel viewModel) {
          return Scaffold(
            backgroundColor: Colors.indigo[600],
            body: viewModel.isInit
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "",
                        style: TextStyle(fontSize: 120),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          "Yarışmaya Hoşgeldin",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 48,
                          ),
                        ),
                      ),
                      Text(
                        viewModel.appUser.userID,
                        style: const TextStyle(
                            fontSize: 24, color: Colors.white70),
                      ),
                      const Text(
                        "",
                        style: TextStyle(fontSize: 100),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 220,
                            width: 220,
                            child: IconButton(
                              icon: const Icon(
                                FontAwesomeIcons.brain,
                                size: 80,
                                color: Colors.lightBlueAccent,
                              ),
                              onPressed: () {
                                viewModel.goPage(1);
                              },
                            ),
                          ),
                          SizedBox(
                            height: 220,
                            width: 220,
                            child: IconButton(
                              icon: const Icon(
                                FlutterIcons.map_marker_mco,
                                size: 120,
                                color: Color.fromRGBO(255, 94, 117, 1),
                              ),
                              onPressed: () {
                                viewModel.goPage(2);
                              },
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 220,
                            width: 220,
                            child: IconButton(
                              icon: const Icon(
                                Icons.music_note_rounded,
                                size: 85,
                                color: Colors.pink,
                              ),
                              onPressed: () {
                                viewModel.goPage(3);
                              },
                            ),
                          ),
                          SizedBox(
                            height: 220,
                            width: 220,
                            child: IconButton(
                              icon: const Icon(
                                FontAwesomeIcons.chessKnight,
                                size: 80,
                                color: Colors.amber,
                              ),
                              onPressed: () {
                                viewModel.goPage(4);
                              },
                            ),
                          )
                        ],
                      )
                    ],
                  )
                : const CircularProgressIndicator(),
          );
        });
  }
}
