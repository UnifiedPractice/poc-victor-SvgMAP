import 'package:flex_chart_body/app/bodyChart/customPaint/bodyPainter.dart';
import 'package:flex_chart_body/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:touchable/touchable.dart';

import 'providers/bodyProvider.dart';

class BodyChart extends StatefulWidget {
  @override
  _BodyChartState createState() => _BodyChartState();
}

class _BodyChartState extends State<BodyChart> {
  bool isInteracting = false;
  FocusNode _canvasNode = new FocusNode();
  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(_canvasNode);
    BodyPartsProvider _bodyPartsProvider =
        Provider.of<BodyPartsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          MenuNames.kBodyChart,
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 5,
            child: ElevatedButton(
              onPressed: () {
                _bodyPartsProvider.togglePartsToRender();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(_bodyPartsProvider.isFront
                      ? BodyChartStrings.kBodyChartRotateBackButton
                      : BodyChartStrings.kBodyChartRotateFrontButton),
                  Icon(_bodyPartsProvider.isFront
                      ? Icons.rotate_right
                      : Icons.rotate_left),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Row(
        children: [
          Expanded(
            child: Container(
              color: Colors.grey[200],
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text('Some random text'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      subtitle:
                          Text('${BodyChartStrings.kSelectedBodyPartText}'),
                      title: Text(
                        '${_bodyPartsProvider.selectedBodyPartId} ${_bodyPartsProvider.selectedBodyPart}',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.w900),
                      ),
                      trailing: _bodyPartsProvider.selectedBodyPart != 'none'
                          ? ElevatedButton(
                              onPressed: () {
                                _bodyPartsProvider.nextBodyPart();
                              },
                              child: Text('Next Part'),
                            )
                          : null,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: InteractiveViewer(
              maxScale: 5,
              minScale: 0.5,
              // onInteractionStart: (scaleStartDetails) => isInteracting = true,
              // onInteractionEnd: (scaleEndDetails) => isInteracting = false,
              constrained: true,
              child: Container(
                padding: EdgeInsets.all(10),

                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                // child: Shortcuts(
                //   shortcuts: {LogicalKeySet(LogicalKeyboardKey.arrowRight): IncrementId()
                //     LogicalKeySet(LogicalKeyboardKey.arrowLeft): DecrementId()},
                child: CanvasTouchDetector(
                  builder: (context) => CustomPaint(
                    painter: BodyPainter(
                        context: context, bodyPartProvider: _bodyPartsProvider),
                  ),
                ),
              ),
            ),
          ),
          // ),
        ],
      ),
    );
  }
}
