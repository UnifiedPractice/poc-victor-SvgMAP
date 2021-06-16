import 'dart:convert';

import 'package:flex_chart_body/app/tongueChart/dataService/tongueJSON.dart';
import 'package:flex_chart_body/app/tongueChart/dataService/tongueModel.dart';
import 'package:flex_chart_body/app/tongueChart/models/tongueOptions.dart';
import 'package:flex_chart_body/sharedModels/models/bodyPart.dart';
import 'package:flutter/cupertino.dart';
import 'package:strings/strings.dart';

class TonguePartsProvider with ChangeNotifier {
  List<SvgComponent> tongueParts = [];
  List<TongueBodyOption> tongueBodyOptions = [];

  TextEditingController textController = TextEditingController();
  String selectedTonguePart = 'No tongue part';
  String generatedSentence = '';

  /// Load Tongue Parts.
  void loadTonguePartsList({required List<SvgComponent> newTongueParts}) {
    this.tongueParts = newTongueParts;
  }

  /// Generate Tongue Body options from json.
  void generateTongueBodyOptions() {
    var retVal;
    String jsonString = jsonEncode(tongueJson);
    Map<String, dynamic> json = jsonDecode(jsonString);
    TongueModel tongueModel = TongueModel.fromJson(json);
    retVal = tongueModel.controls.first.options
        .map((e) => TongueBodyOption(option: e, isSelected: false))
        .toList();
    return tongueBodyOptions = retVal;
  }

  void updateSelectedTonguePart({required String newBodyPart}) {
    selectedTonguePart = newBodyPart;
    String textInputBodyOptions = newBodyPart;
    String displayedSelectedTonguePart = capitalize(
      newBodyPart.replaceAll('tongue_', ''),
    );
    textInputBodyOptions = tongueBodyOptions
        .where((element) => element.isSelected)
        .map((e) => e.option)
        .toList()
        .toString()
        .replaceAll('[', '')
        .replaceAll(']', '');
    textController.text = '$displayedSelectedTonguePart $textInputBodyOptions';
    notifyListeners();
  }

  void updateGeneratedSentence() {
    String displayedSelectedTonguePart = capitalize(
      selectedTonguePart.replaceAll('tongue_', '') + ':',
    );
    int cursorPosition = textController.selection.start;

    textController.text =
        '$displayedSelectedTonguePart ${tongueBodyOptions.where((element) => element.isSelected).map((e) => e.option).toList().toString().replaceAll('[', '').replaceAll(']', '')}';
    textController.selection = TextSelection.fromPosition(
      TextPosition(offset: textController.text.length),
    );
    notifyListeners();
  }

  void checkSentenceForOptions(List<TongueBodyOption> checkedList) {
    tongueBodyOptions.forEach((element) {
      if (checkedList.contains(element)) {
        element.isSelected = true;
      } else
        element.isSelected = false;
    });
    notifyListeners();
  }
}
