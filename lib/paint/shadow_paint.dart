import 'package:flutter/material.dart';

class ShadowPainter extends CustomPainter {
  final Offset offset;
  final Size size;

  ShadowPainter({required this.offset, required this.size});

  @override
  void paint(Canvas canvas, Size canvasSize) {
    final paint = Paint()
      ..color = Colors.black.withOpacity(0.7)
      ..style = PaintingStyle.fill;

    final path = Path()
      ..addRect(Rect.fromLTWH(0, 0, canvasSize.width, canvasSize.height))
      ..addRRect(RRect.fromRectAndRadius(offset & size, const Radius.circular(12)))
      ..fillType = PathFillType.evenOdd;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
