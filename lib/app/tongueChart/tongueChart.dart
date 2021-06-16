import 'package:flex_chart_body/app/tongueChart/localWidgets/paintedTongue.dart';
import 'package:flex_chart_body/app/tongueChart/localWidgets/tongueBodyOptionsList.dart';
import 'package:flex_chart_body/app/tongueChart/localWidgets/tongueFurOptionsList.dart';
import 'package:flex_chart_body/app/tongueChart/localWidgets/tongueTextInputZone.dart';
import 'package:flex_chart_body/app/tongueChart/providers/tonguePartsProvider.dart';
import 'package:flex_chart_body/constants/colors.dart';
import 'package:flex_chart_body/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:strings/strings.dart';

class TongueChart extends StatefulWidget {
  @override
  _TongueChartState createState() => _TongueChartState();
}

class _TongueChartState extends State<TongueChart> {
  @override
  Widget build(BuildContext context) {
    TonguePartsProvider _tonguePartProvider =
        Provider.of<TonguePartsProvider>(context);

    List<Widget> test =
        List.generate(_tonguePartProvider.tongueBodyOptions.length, (index) {
      return ListTileTheme(
        selectedColor: Colors.white,
        child: ListTile(
          selected: _tonguePartProvider.tongueBodyOptions[index].isSelected,
          selectedTileColor: UnifiedPracticeColors.kUnifiedPracticePrimaryColor,
          title: Text(
            '${capitalize(_tonguePartProvider.tongueBodyOptions[index].option)}',
            style: TextStyle(),
          ),
          onTap: () {
            _tonguePartProvider.tongueBodyOptions[index].isSelected =
                !_tonguePartProvider.tongueBodyOptions[index].isSelected;
            _tonguePartProvider.updateGeneratedSentence();
          },
        ),
      );
    });

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          MenuNames.kBodyChart,
        ),
      ),
      body: Row(
        children: [
          /// TONGUE Selection ZONE
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      PaintedTongue(tonguePartProvider: _tonguePartProvider),
                      TongueBodyOptionsList(test: test),
                      TongueFurOptionsList(),
                    ],
                  ),
                ),
              ],
            ),
          ),

          /// TEXT Input ZONE
          TongueTextInputZone(tonguePartProvider: _tonguePartProvider),
          // ),
        ],
      ),
    );
  }
}
