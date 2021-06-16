import 'package:flex_chart_body/app/bodyChart/providers/bodyProvider.dart';
import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';
import 'package:touchable/touchable.dart';

class BodyPainter extends CustomPainter {
  final BuildContext context;
  final BodyPartsProvider bodyPartProvider;
  BodyPainter({required this.context, required this.bodyPartProvider});

  @override
  void paint(Canvas canvas, Size size) {
    TouchyCanvas ourCanvas = TouchyCanvas(context, canvas);
    var paint = Paint()..strokeWidth = 1;

    /// Scale math goes here, we scale up each path to match it's canvas size zone.
    final xScale = size.width / 244 / 4;
    final yScale = size.height / 567;
    final Matrix4 matrix4 = Matrix4.identity();
    matrix4.scale(xScale, yScale);

    bodyPartProvider.bodyPartsToRender.forEach((bodyPart) {
      Path path = parseSvgPathData(bodyPart.path);
      if (bodyPartProvider.selectedBodyPart == bodyPart.name) {
        bodyPart.activeColor = bodyPart.selectedColor;
      } else
        bodyPart.activeColor = bodyPart.fillColor;
      ourCanvas.drawPath(
        path.transform(matrix4.storage).shift(
              Offset((size.width - 244 * xScale) / 2,
                  (size.height - 567 * yScale) / 2),
            ),
        paint
          ..color = Color(
            int.parse(bodyPart.activeColor),
          ),
        onTapDown: (details) {
          print('click ${bodyPart.name}');
          bodyPartProvider.updateSelectedBodyPart(
              newBodyPart: bodyPart.name,
              newBodyPartId: bodyPart.id.toString());
        },
      );
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
