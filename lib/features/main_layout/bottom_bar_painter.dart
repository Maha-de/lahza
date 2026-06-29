import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomBarPainter extends CustomPainter {
  const BottomBarPainter({
    required this.centerX,
  });

  final double centerX;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final shadowPaint = Paint()
      ..color = Colors.black.withValues(alpha: .12)
      ..maskFilter = const MaskFilter.blur(
        BlurStyle.normal,
        12,
      );

    final path = Path();

    /// نفس مقاسات الكيرف القديمة
    final start = centerX - size.width * .22;
    final end = centerX + size.width * .22;

    path.moveTo(0, 0);

    path.lineTo(start, 0);

    path.cubicTo(
      centerX - size.width * .13,
      0,
      centerX - size.width * .12,
      50.h,
      centerX,
      50.h,
    );

    path.cubicTo(
      centerX + size.width * .12,
      50.h,
      centerX + size.width * .13,
      0,
      end,
      0,
    );

    path.lineTo(size.width, 0);

    path.lineTo(size.width, size.height);

    path.lineTo(0, size.height);

    path.close();

    canvas.drawPath(
      path.shift(const Offset(0, -2)),
      shadowPaint,
    );

    canvas.drawPath(path, paint);

    final borderPaint = Paint()
      ..color = const Color(0xffE5E7EB)
      ..strokeWidth = .8;

    canvas.drawLine(
      const Offset(0, 0),
      Offset(start, 0),
      borderPaint,
    );

    canvas.drawLine(
      Offset(end, 0),
      Offset(size.width, 0),
      borderPaint,
    );
  }

  @override
  bool shouldRepaint(covariant BottomBarPainter oldDelegate) {
    return oldDelegate.centerX != centerX;
  }
}