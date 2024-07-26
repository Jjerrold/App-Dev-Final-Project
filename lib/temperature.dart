import 'package:flutter/material.dart';

class TemperatureTab extends StatefulWidget {
  const TemperatureTab({super.key});

  @override
  State<TemperatureTab> createState() => _TemperatureTabState();
}

class _TemperatureTabState extends State<TemperatureTab> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: const Color(0xFF4591D8),
                borderRadius: BorderRadius.circular(10.0),
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
                  SizedBox(height: 5.0,),
                  Icon(
                    Icons.thermostat,
                    color: Colors.white,
                    size: 30,
                    ),
                  Text(
                    '40°C',
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    'Temperature',
                    style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5.0),
            Container(
              padding: const EdgeInsets.all(16.0),  
              child: Column(
                children: [
                const Text(
                    'Today, 4PM',
                    style: TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                const  Text(
                    '40°C',
                    style: TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  CustomPaint(
                    size: const Size(300, 150),
                    painter: TemperatureChartPainter(),
                  ),
                  const SizedBox(height: 5.0),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('12PM'),
                      Text('1PM'),
                      Text('2PM'),
                      Text('3PM'),
                      Text('4PM'),
                      Text('5PM'),
                      Text('6PM'),
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

class TemperatureChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.orange
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(0, size.height - 20);
    path.lineTo(size.width * 0.1, size.height * 0.8);
    path.lineTo(size.width * 0.3, size.height * 0.7);
    path.lineTo(size.width * 0.5, size.height * 0.6);
    path.lineTo(size.width * 0.7, size.height * 0.5);
    path.lineTo(size.width * 0.9, size.height * 0.6);
    path.lineTo(size.width, size.height * 0.7);
    canvas.drawPath(path, paint);

    final paint2 = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final path2 = Path();
    path2.moveTo(size.width * 0.5, size.height * 0.6);
    path2.lineTo(size.width * 0.7, size.height * 0.5);
    path2.lineTo(size.width * 0.9, size.height * 0.6);
    path2.lineTo(size.width, size.height * 0.7);

    canvas.drawPath(path2, paint2);

    // Draw grid lines
    final gridPaint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    for (int i = 0; i < 8; i++) {
      canvas.drawLine(Offset(0, size.height * (i / 8)), Offset(size.width, size.height * (i / 8)), gridPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
