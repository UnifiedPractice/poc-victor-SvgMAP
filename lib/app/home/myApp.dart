import 'package:flex_chart_body/SharedServices/filesProcessServices.dart';
import 'package:flex_chart_body/app/bodyChart/providers/bodyProvider.dart';
import 'package:flex_chart_body/app/home/drawerMenu/ourDrawerMenu.dart';
import 'package:flex_chart_body/app/tongueChart/providers/tonguePartsProvider.dart';
import 'package:flex_chart_body/constants/assetsPath.dart';
import 'package:flex_chart_body/constants/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FilesProcessServices loader = FilesProcessServices();
    BodyPartsProvider _bodyPartsProvider =
        Provider.of<BodyPartsProvider>(context, listen: false);
    TonguePartsProvider _tonguePartsProvider =
        Provider.of<TonguePartsProvider>(context, listen: false);
    _tonguePartsProvider.generateTongueBodyOptions();
    loader.loadBodyParts(
        isBackBody: true,
        path: UnifiedPracticeAssetsPath.kBodyMapBackSvg,
        bodyPartsProvider: _bodyPartsProvider);
    loader.loadBodyParts(
        isBackBody: false,
        path: UnifiedPracticeAssetsPath.kBodyMapFrontSvg,
        bodyPartsProvider: _bodyPartsProvider);
    loader.loadTongueParts(
        path: UnifiedPracticeAssetsPath.kTongueSvg,
        tonguePartsProvider: _tonguePartsProvider);

    return Scaffold(
      drawer: OurDrawerMenu(),
      appBar: AppBar(
        title: Text(MenuNames.kHomeScreenTitle),
      ),
      body: Container(),
    );
  }
}
