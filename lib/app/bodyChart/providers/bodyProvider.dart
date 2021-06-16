import 'package:flex_chart_body/sharedModels/models/bodyPart.dart';
import 'package:flutter/cupertino.dart';

class BodyPartsProvider with ChangeNotifier {
  bool isFront = true;
  String selectedBodyPart = 'none';
  String selectedBodyPartId = '';
  List<SvgComponent> backBodyParts = [];
  List<SvgComponent> frontBodyParts = [];

  /// Switch render side
  get bodyPartsToRender {
    return isFront ? frontBodyParts : backBodyParts;
  }

  void loadBodyPartsList(
      {required bool isBackBody, required List<SvgComponent> bodyParts}) {
    if (isBackBody)
      backBodyParts = bodyParts;
    else
      frontBodyParts = bodyParts;
  }

  void updateSelectedBodyPart(
      {required String newBodyPart, required String newBodyPartId}) {
    selectedBodyPart = newBodyPart;
    selectedBodyPartId = newBodyPartId;
    notifyListeners();
  }

  void nextBodyPart() {
    int parsedNewBodyPartId = int.parse(selectedBodyPartId) + 1;

    if (isFront) {
      if (parsedNewBodyPartId > frontBodyParts.length) return;
      String newBodyPartId = (parsedNewBodyPartId).toString();
      String newBodyPart = frontBodyParts
          .firstWhere(
            (element) => element.id == parsedNewBodyPartId,
          )
          .name;
      if (newBodyPart.contains('Shape')) {
        selectedBodyPartId = parsedNewBodyPartId.toString();
        nextBodyPart();
        return;
      }

      updateSelectedBodyPart(
          newBodyPart: newBodyPart, newBodyPartId: newBodyPartId);
    }

    notifyListeners();
  }

  void togglePartsToRender() {
    isFront = !isFront;
    notifyListeners();
  }
}
