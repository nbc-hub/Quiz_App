import 'dart:math';
import 'package:flutter/material.dart';

class QuestionModel {
  String text;
  String option1text;
  bool option1iscorrect;
  String option2text;
  bool option2iscorrect;
  String option3text;
  bool option3iscorrect;
  String option4text;
  bool option4iscorrect;

  QuestionModel(
      this.option1text,
      this.option1iscorrect,
      this.option2text,
      this.option2iscorrect,
      this.option3text,
      this.option3iscorrect,
      this.option4text,
      this.option4iscorrect,
      {@required this.text});

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'option1text': option1text ?? "",
      'option1iscorrect': option1iscorrect ?? false,
      'option2text': option2text ?? "",
      'option2iscorrect': option2iscorrect ?? false,
      'option3text': option3text ?? "",
      'option3iscorrect': option3iscorrect ?? false,
      'option4text': option4text ?? "",
      'option4iscorrect': option4iscorrect ?? false,
    };
  }

  QuestionModel.fromMap(Map<String, dynamic> map)
      : text = map['text'],
        option1text = map['option1text'],
        option1iscorrect = map['option1iscorrect'],
        option2text = map['option2text'],
        option2iscorrect = map['option2iscorrect'],
        option3text = map['option3text'],
        option3iscorrect = map['option3iscorrect'],
        option4text = map['option4text'],
        option4iscorrect = map['option4iscorrect'];
}
