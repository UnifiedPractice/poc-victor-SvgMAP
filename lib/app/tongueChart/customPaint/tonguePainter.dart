import 'package:flex_chart_body/app/tongueChart/providers/tonguePartsProvider.dart';
import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';
import 'package:touchable/touchable.dart';

class TonguePainter extends CustomPainter {
  final BuildContext context;
  final TonguePartsProvider tonguePartProvider;
  TonguePainter({required this.context, required this.tonguePartProvider});

  @override
  void paint(Canvas canvas, Size size) {
    TouchyCanvas ourCanvas = TouchyCanvas(context, canvas);
    var paint = Paint()..strokeWidth = 1;

    /// Scale math goes here, we scale up each path to match it's canvas size zone.
    final xScale = size.width / 193;
    final yScale = size.height / 270;
    final Matrix4 matrix4 = Matrix4.identity();
    matrix4.scale(xScale, yScale);

    tonguePartProvider.tongueParts.forEach((bodyPart) {
      Path path = parseSvgPathData(bodyPart.path);
      if (tonguePartProvider.selectedTonguePart != bodyPart.name) {
        bodyPart.activeColor = '0xFF808080';
      } else
        bodyPart.activeColor = bodyPart.fillColor;
      // ourCanvas.drawShadow(
      //   path.transform(matrix4.storage).shift(
      //         Offset(size.width / 3, size.height / 30),
      //       ),
      //   Colors.black,
      //   8,
      //   false,
      // );

      ourCanvas.drawPath(
        path.transform(matrix4.storage).shift(
              Offset((size.width - 193 * xScale) / 2,
                  (size.height - 270 * yScale) / 2),
            ),
        paint
          ..color = Color(
            int.parse(bodyPart.activeColor),
          ),
        onTapDown: (details) {
          print('click ${bodyPart.name}');

          tonguePartProvider.updateSelectedTonguePart(
            newBodyPart: bodyPart.name,
          );
        },
      );
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
