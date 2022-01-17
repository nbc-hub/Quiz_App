import 'package:flutter/material.dart';
import 'package:ornek_proje/common_widget/platform_responsive_alert_dialog.dart';
import 'package:ornek_proje/core/base/modelview/base_view_model.dart';
import 'package:ornek_proje/core/constants/router_constants.dart';

class QuizViewModel extends BaseViewModel {
  bool isInit = false;
  int questionIndex = 1;
  String code = "";
  String categoryName = "";
  String categoryNameForTitle = "";
  int currentPoint = 0;

  @override
  void init() {
    setCategoryNames();
    questionRead();
    //  isCorrect();
  }

  @override
  void dispose() {
    isInit = false;
    questionIndex = 1;
    categoryName = "";
    categoryNameForTitle = "";
    code = "";
    currentPoint = 0;
    super.dispose();
  }

  @override
  void setContext(BuildContext context) {
    this.context = context;
  }

  void setCategoryNames() {
    if (categoryID == 1) {
      categoryName = "culturequestions";
      categoryNameForTitle = "Genel Kültür";
    } else if (categoryID == 2) {
      categoryName = "geographyquestions";
      categoryNameForTitle = "Coğrafya";
    } else if (categoryID == 3) {
      categoryName = "musicquestions";
      categoryNameForTitle = "Music";
    } else if (categoryID == 4) {
      categoryName = "historyquestions";
      categoryNameForTitle = "Tarih";
    }
  }

  void isCorrect() {
    if (appRepository.questionModel.option1iscorrect) {
      code = "A";
    } else if (appRepository.questionModel.option2iscorrect) {
      code = "B";
    } else if (appRepository.questionModel.option3iscorrect) {
      code = "C";
    } else if (appRepository.questionModel.option4iscorrect) {
      code = "D";
    }
  }

  void questionRead() async {
    try {
      await appRepository.readQuestionModel(
          categoryName, questionIndex.toString());
      if (appRepository.questionModel.option1iscorrect) {
        code = "A";
      } else if (appRepository.questionModel.option2iscorrect) {
        code = "B";
      } else if (appRepository.questionModel.option3iscorrect) {
        code = "C";
      } else if (appRepository.questionModel.option4iscorrect) {
        code = "D";
      }
      isInit = true;
      setState();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> trueOption() async {
    if (questionIndex != 5) {
      questionIndex++;
    }
    currentPoint += 20;
    final value = await PlatformResponsiveAlertDialog(
      title: "Tebrikler",
      content: "20 Puan Kazandın",
      mainButtonText: "Tamam",
    ).showPlatformDialog(context);

    if (value) {
      if (questionIndex != 5) {
        questionRead();
      }
    }
  }

  Future<void> falseOption() async {
    questionIndex++;
    final value = await PlatformResponsiveAlertDialog(
      title: "Üzgünüm",
      content: "Yanlış Cevap Verdin",
      mainButtonText: "Yarışmadan Ayrıl",
    ).showPlatformDialog(context);

    if (value) {
      navigationService.pushNamedAndRemoveUntil(RouteConstant.HOME_PAGE_ROUTE);
    }
  }

  Future<void> isOver() async {
    if (appRepository.appUser.bestPoint < currentPoint) {
      await appRepository.updateBestPoint(currentPoint);
    }
    if (categoryName == "culturequestions") {
      if (appRepository.appUser.culturePoint < currentPoint) {
        await appRepository.updateCategoryPoint(categoryName, currentPoint);
      }
    } else if (categoryName == "geographyquestions") {
      if (appRepository.appUser.geographyPoint < currentPoint) {
        await appRepository.updateCategoryPoint(categoryName, currentPoint);
      }
    } else if (categoryName == "musicquestions") {
      if (appRepository.appUser.musicPoint < currentPoint) {
        await appRepository.updateCategoryPoint(categoryName, currentPoint);
      }
    } else if (categoryName == "historyquestions") {
      if (appRepository.appUser.historyPoint < currentPoint) {
        await appRepository.updateCategoryPoint(categoryName, currentPoint);
      }
    }
    final value = await PlatformResponsiveAlertDialog(
      title: "Yarışma Sona Erdi",
      content: "Puanınız $currentPoint",
      mainButtonText: "Yarışmadan Ayrıl",
    ).showPlatformDialog(context);

    if (value) {
      navigationService.pushNamedAndRemoveUntil(RouteConstant.HOME_PAGE_ROUTE);
    }
  }
}
