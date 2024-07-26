// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class NoiseTab extends StatefulWidget {
  const NoiseTab({super.key});

  @override
  State<NoiseTab> createState() => _NoiseTabState();
}

class _NoiseTabState extends State<NoiseTab> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: const Color(0xFF4591D8),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.mic,
                      color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(height: 5),
                    Text(
                      '30 DB',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      'Noise Levels',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromARGB(255, 217, 217, 217),
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: CustomPaint(
                size: const Size(300, 250),
                painter: MyCustomPainter(),
              ),
            ),
            const SizedBox(height: 15),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Sun'),
                Text('Mon'),
                Text('Tue'),
                Text('Wed'),
                Text('Thur'),
                Text('Fri'),
                Text('Sat'),
              ],
            ),
          ],
        ),
      );
  }
}

class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint greenPaint = Paint()
      ..color = const Color(0xFF90EE90)
      ..strokeWidth = 3.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    Path greenPath = Path();
    greenPath.moveTo(0, size.height * 0.85);
    greenPath.lineTo(size.width * 0.1, size.height * 0.8);
    greenPath.lineTo(size.width * 0.2, size.height * 0.7);
    greenPath.lineTo(size.width * 0.3, size.height * 0.6);
    greenPath.lineTo(size.width * 0.4, size.height * 0.5);
    greenPath.lineTo(size.width * 0.5, size.height * 0.4);
    greenPath.lineTo(size.width * 0.6, size.height * 0.5);
    greenPath.lineTo(size.width * 0.7, size.height * 0.6);
    greenPath.lineTo(size.width * 0.8, size.height * 0.7);
    greenPath.lineTo(size.width * 0.9, size.height * 0.8);
    greenPath.lineTo(size.width, size.height * 0.9);
    canvas.drawPath(greenPath, greenPaint);

    Paint orangePaint = Paint()
      ..color = const Color(0xFFFFD700)
      ..strokeWidth = 3.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    Path orangePath = Path();
    orangePath.moveTo(0, size.height * 0.5);
    orangePath.lineTo(size.width * 0.1, size.height * 0.4);
    orangePath.lineTo(size.width * 0.2, size.height * 0.3);
    orangePath.lineTo(size.width * 0.3, size.height * 0.25);
    orangePath.lineTo(size.width * 0.4, size.height * 0.25);
    orangePath.lineTo(size.width * 0.5, size.height * 0.25);
    orangePath.lineTo(size.width * 0.6, size.height * 0.2);
    orangePath.lineTo(size.width * 0.7, size.height * 0.25);
    orangePath.lineTo(size.width * 0.8, size.height * 0.3);
    orangePath.lineTo(size.width * 0.9, size.height * 0.35);
    orangePath.lineTo(size.width, size.height * 0.4);
    canvas.drawPath(orangePath, orangePaint);

    Paint bluePaint = Paint()
      ..color = Color.fromARGB(255, 113, 200, 230)
      ..strokeWidth = 3.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    Path bluePath = Path();
    bluePath.moveTo(0, size.height * 0.1);
    bluePath.lineTo(size.width * 0.1, size.height * 0.2);
    bluePath.lineTo(size.width * 0.2, size.height * 0.25);
    bluePath.lineTo(size.width * 0.3, size.height * 0.1);
    bluePath.lineTo(size.width * 0.4, size.height * 0.15);
    bluePath.lineTo(size.width * 0.5, size.height * 0.1);
    bluePath.lineTo(size.width * 0.6, size.height * 0.05);
    bluePath.lineTo(size.width * 0.7, size.height * 0.15);
    bluePath.lineTo(size.width * 0.8, size.height * 0.2);
    bluePath.lineTo(size.width * 0.9, size.height * 0.15);
    bluePath.lineTo(size.width, size.height * 0.1);
    canvas.drawPath(bluePath, bluePaint);

    // Draw lines
    Paint linePaint = Paint()
      ..color = Color.fromARGB(163, 189, 189, 189)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    canvas.drawLine(Offset(0, size.height * 0.25), Offset(size.width, size.height * 0.25), linePaint);
    canvas.drawLine(Offset(0, size.height * 0.5), Offset(size.width, size.height * 0.5), linePaint);
    canvas.drawLine(Offset(0, size.height * 0.75), Offset(size.width, size.height * 0.75), linePaint);
    canvas.drawLine(Offset(0, size.height * 1.0), Offset(size.width, size.height * 1.0), linePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
