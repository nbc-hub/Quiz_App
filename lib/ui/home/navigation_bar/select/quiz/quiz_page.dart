import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ornek_proje/core/base/view/base_view.dart';
import 'package:ornek_proje/ui/home/navigation_bar/select/quiz/quiz_view_model.dart';
import 'package:ornek_proje/ui/home/navigation_bar/select/select_view_model.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<QuizViewModel>(
        viewModel: QuizViewModel(),
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuilder: (BuildContext context, QuizViewModel viewModel) {
          return Scaffold(
            backgroundColor: Colors.indigo[600],
            body: viewModel.isInit
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "",
                          style: TextStyle(fontSize: 100),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Text(
                            viewModel.categoryNameForTitle,
                            style: const TextStyle(
                                fontSize: 44, color: Colors.amber),
                          ),
                        ),
                        Text(
                          (viewModel.currentPoint.toString()),
                          style: const TextStyle(fontSize: 36),
                        ),
                        const Text(
                          "",
                          style: TextStyle(fontSize: 60),
                        ),
                        SizedBox(
                            width: 520,
                            height: 360,
                            child: Card(
                              color: Colors.indigo[600],
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              child: Center(
                                child: Text(
                                  viewModel.appRepository.questionModel.text,
                                  style: const TextStyle(
                                      color: Colors.amber, fontSize: 36),
                                ),
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Stack(
                              children: <Widget>[
                                Positioned.fill(
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: <Color>[
                                          Color.fromRGBO(0, 192, 255, 0.3),
                                          Color.fromRGBO(0, 192, 255, 0.6),
                                          Color.fromRGBO(0, 192, 255, 0.3),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 520,
                                  height: 45,
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      padding: const EdgeInsets.all(8.0),
                                      primary: Colors.amber,
                                      textStyle: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    onPressed: () {
                                      if (viewModel.code == "A") {
                                        if (viewModel.questionIndex == 5) {
                                          viewModel.trueOption();
                                          viewModel.isOver();
                                        } else {
                                          viewModel.trueOption();
                                        }
                                      } else {
                                        viewModel.isOver();
                                      }
                                    },
                                    child: Text(
                                        viewModel.questionModel.option1text),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Stack(
                              children: <Widget>[
                                Positioned.fill(
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: <Color>[
                                          Color.fromRGBO(0, 192, 255, 0.3),
                                          Color.fromRGBO(0, 192, 255, 0.6),
                                          Color.fromRGBO(0, 192, 255, 0.3),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 520,
                                  height: 45,
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      padding: const EdgeInsets.all(8.0),
                                      primary: Colors.amber,
                                      textStyle: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    onPressed: () {
                                      if (viewModel.code == "B") {
                                        if (viewModel.questionIndex == 5) {
                                          viewModel.trueOption();
                                          viewModel.isOver();
                                        } else {
                                          viewModel.trueOption();
                                        }
                                      } else {
                                        viewModel.isOver();
                                      }
                                    },
                                    child: Text(
                                        viewModel.questionModel.option2text),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Stack(
                              children: <Widget>[
                                Positioned.fill(
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: <Color>[
                                          Color.fromRGBO(0, 192, 255, 0.3),
                                          Color.fromRGBO(0, 192, 255, 0.6),
                                          Color.fromRGBO(0, 192, 255, 0.3),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 520,
                                  height: 45,
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      padding: const EdgeInsets.all(8.0),
                                      primary: Colors.amber,
                                      textStyle: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    onPressed: () {
                                      if (viewModel.code == "C") {
                                        if (viewModel.questionIndex == 5) {
                                          viewModel.trueOption();
                                          viewModel.isOver();
                                        } else {
                                          viewModel.trueOption();
                                        }
                                      } else {
                                        viewModel.isOver();
                                      }
                                    },
                                    child: Text(
                                        viewModel.questionModel.option3text),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Stack(
                              children: <Widget>[
                                Positioned.fill(
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: <Color>[
                                          Color.fromRGBO(0, 192, 255, 0.3),
                                          Color.fromRGBO(0, 192, 255, 0.6),
                                          Color.fromRGBO(0, 192, 255, 0.3),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 520,
                                  height: 45,
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      padding: const EdgeInsets.all(8.0),
                                      primary: Colors.amber,
                                      textStyle: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    onPressed: () {
                                      if (viewModel.code == "D") {
                                        if (viewModel.questionIndex == 5) {
                                          viewModel.trueOption();
                                          viewModel.isOver();
                                        } else {
                                          viewModel.trueOption();
                                        }
                                      } else {
                                        viewModel.isOver();
                                      }
                                    },
                                    child: Text(
                                        viewModel.questionModel.option4text),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : const CircularProgressIndicator(),
          );
        });
  }
}
