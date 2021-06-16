import 'package:flex_chart_body/app/tongueChart/customPaint/tonguePainter.dart';
import 'package:flex_chart_body/app/tongueChart/providers/tonguePartsProvider.dart';
import 'package:flex_chart_body/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:strings/strings.dart';
import 'package:touchable/touchable.dart';

class PaintedTongue extends StatelessWidget {
  const PaintedTongue({
    Key? key,
    required TonguePartsProvider tonguePartProvider,
  })  : _tonguePartProvider = tonguePartProvider,
        super(key: key);

  final TonguePartsProvider _tonguePartProvider;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width / 4,
                  padding: EdgeInsets.all(10),
                  // child: Shortcuts(
                  //   shortcuts: {LogicalKeySet(LogicalKeyboardKey.arrowRight): IncrementId()
                  //     LogicalKeySet(LogicalKeyboardKey.arrowLeft): DecrementId()},
                  child: CanvasTouchDetector(
                    builder: (context) => CustomPaint(
                      painter: TonguePainter(
                          context: context,
                          tonguePartProvider: _tonguePartProvider),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                subtitle: Text(
                  TongueChartStrings.kSelectedTonguePartText,
                  textAlign: TextAlign.center,
                ),
                title: Text(
                  '${capitalize(
                    _tonguePartProvider.selectedTonguePart
                        .replaceFirst('tongue_', ''),
                  )}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
