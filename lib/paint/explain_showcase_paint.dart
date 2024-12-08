import 'package:flutter/material.dart';

class UpwardTrianglePainter extends CustomPainter {
  final Color color;

  UpwardTrianglePainter({required this.color});


  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(size.width / 2, 0) // Top vertex
      ..lineTo(size.width, size.height) // Bottom right vertex
      ..lineTo(0, size.height) // Bottom left vertex
      ..close(); // Close the path to form a triangle

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class RightTrianglePainter extends CustomPainter {
  final Color color;
  RightTrianglePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(size.width, size.height / 2) // Right vertex
      ..lineTo(0, 0) // Top left vertex
      ..lineTo(0, size.height) // Bottom left vertex
      ..close(); // Close the path to form a triangle

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class LeftTrianglePainter extends CustomPainter {
  final Color color;

  LeftTrianglePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, size.height / 2) // Left vertex
      ..lineTo(size.width, 0) // Top right vertex
      ..lineTo(size.width, size.height) // Bottom right vertex
      ..close(); // Close the path to form a triangle

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class DownwardTrianglePainter extends CustomPainter {
  final Color color;
  DownwardTrianglePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0) // Top left vertex
      ..lineTo(size.width, 0) // Top right vertex
      ..lineTo(size.width / 2, size.height) // Bottom vertex
      ..close(); // Close the path to form a triangle

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}