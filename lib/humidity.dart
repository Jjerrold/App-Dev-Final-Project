import 'package:flutter/material.dart';

class HumidityTab extends StatefulWidget {
  const HumidityTab({super.key});

  @override
  State<HumidityTab> createState() => _HumidityTabState();
}

class _HumidityTabState extends State<HumidityTab> {
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
                  borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.water_drop, color: Colors.white, size: 30),
                    SizedBox(height: 5),
                    Text(
                      '40°',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Humidity',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Humidity', style: TextStyle(fontSize: 16)),
                        Row(
                          children: [
                            Text('Today'),
                            Icon(Icons.arrow_drop_down),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    CustomPaint(
                      size: const Size(280, 100),
                      painter: HumidityGraphPainter(),
                    ),
                    const SizedBox(height: 12),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('24°'),
                        Text('33°'),
                        Text('29°'),
                        Text('35°'),
                        Text('24°'),
                        Text('40°'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
  }
}

class HumidityGraphPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint linePaint = Paint()
      ..color = const Color.fromARGB(255, 138, 135, 135)
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    Path path = Path();
    path.moveTo(0, size.height - 20);
    path.lineTo(size.width / 6, size.height - 50);
    path.lineTo(size.width / 3, size.height - 30);
    path.lineTo(size.width / 2, size.height - 40);
    path.lineTo((size.width * 5) / 6, size.height - 60);
    path.lineTo(size.width, size.height - 20);
    canvas.drawPath(path, linePaint);

    // Draw dots
    canvas.drawCircle(Offset(size.width / 6, size.height - 50), 5, Paint()..color = const Color(0xFF4591D8));
    canvas.drawCircle(Offset(size.width / 3, size.height - 30), 5, Paint()..color = const Color(0xFF4591D8));
    canvas.drawCircle(Offset(size.width / 2, size.height - 40), 5, Paint()..color = const Color(0xFF4591D8));
    canvas.drawCircle(Offset((size.width * 5) / 6, size.height - 60), 5, Paint()..color = const Color(0xFF4591D8));
    canvas.drawCircle(Offset(size.width, size.height - 20), 5, Paint()..color = const Color(0xFF4591D8));

    // Draw vertical lines
    for (int i = 0; i < 6; i++) {
      canvas.drawLine(Offset(size.width / 6 * i, 0), Offset(size.width / 6 * i, size.height), Paint()..color = Colors.grey.shade300..strokeWidth = 1);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}