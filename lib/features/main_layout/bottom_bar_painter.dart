import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final path = Path();

    path.moveTo(0, 0);

path.lineTo(size.width * .28, 0);

path.cubicTo(
  size.width * .37,
  0,
  size.width * .38,
  50.h,
  size.width * .50,
  50.h,
);

path.cubicTo(
  size.width * .62,
  50.h,
  size.width * .63,
  0,
  size.width * .72,
  0,
);

    path.lineTo(size.width, 0);

    path.lineTo(size.width, size.height);

    path.lineTo(0, size.height);

    path.close();

    final shadowPaint = Paint()
      ..color = Colors.black.withValues(alpha: 0.12)
      ..maskFilter = const MaskFilter.blur(
        BlurStyle.normal,
        12,
      );

    canvas.drawPath(
      path.shift(const Offset(0, -2)),
      shadowPaint,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}