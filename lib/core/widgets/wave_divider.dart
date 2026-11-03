import 'package:flutter/material.dart';

class WaveDivider extends StatelessWidget {
  final Color waveColor;
  final double height;

  const WaveDivider({
    super.key,
    required this.waveColor,
    this.height = 70.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: CustomPaint(
        painter: _WavePainter(color: waveColor),
      ),
    );
  }
}

class _WavePainter extends CustomPainter {
  final Color color;

  _WavePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, 0);

    // Smooth subtle S-wave transition
    path.cubicTo(
      size.width * 0.25,
      size.height * 0.85,
      size.width * 0.75,
      0,
      size.width,
      size.height,
    );

    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _WavePainter oldDelegate) =>
      oldDelegate.color != color;
}

