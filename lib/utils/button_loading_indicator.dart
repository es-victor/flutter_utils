import 'dart:math';

import 'package:flutter/material.dart';

import '../colors.dart';
import '../constants.dart';

class ButtonLoadingIndicator extends StatelessWidget {
  const ButtonLoadingIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 24,
      width: 24,
      child: CircularProgressIndicator(
        color: Colors.white,
        strokeWidth: 2,
      ),
    );
  }
}

class LoadingIndicator extends StatelessWidget {
  final double size;
  final double stroke;
  final Color? color;
  const LoadingIndicator({
    Key? key,
    this.size = 24.0,
    this.stroke = 3.0,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: size,
        width: size,
        child: CircularProgressIndicator(
          color: Theme.of(context).primaryColor,
          strokeWidth: stroke,
          valueColor:
              color != null ? AlwaysStoppedAnimation<Color>(color!) : null,
        ),
      ),
    );
  }
}

class LoadingWithLabelCenter extends StatelessWidget {
  const LoadingWithLabelCenter({
    Key? key,
    required this.label,
  }) : super(key: key);
  final String label;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: cGrey3,
            ),
          ),
          const SizedBox(height: p4),
          const LoadingIndicator()
        ],
      ),
    );
  }
}

class VGOLoadingIndicator extends StatefulWidget {
  const VGOLoadingIndicator({Key? key}) : super(key: key);

  @override
  State<VGOLoadingIndicator> createState() => _VGOLoadingIndicatorState();
}

class _VGOLoadingIndicatorState extends State<VGOLoadingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  @override
  void initState() {
    // TODO: implement initState
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOut,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: cGrey8,
            shape: BoxShape.circle,
          ),
          child: CustomPaint(
            painter: LoadingPainter(),
          ),
        ),
      ],
    );
  }
}

class LoadingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var w = size.width;
    var h = size.height;
    var centerX = w / 2;
    var centerY = h / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerY, centerX);

    var innerSmallCirclePaint = Paint()..color = Colors.grey.shade100;

    var dashLinesHeavy = Paint()
      ..color = Colors.deepOrange.shade500
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = p4;

    canvas.drawCircle(center, radius - 24, innerSmallCirclePaint);
    for (var i = 0; i < 6; i++) {
      canvas.drawLine(
        Offset(
          centerX + (radius) * cos(i * pi / 3),
          centerY + (radius) * sin(i * pi / 3),
        ),
        Offset(
          centerX + radius * cos(i * pi / 3),
          centerY + radius * sin(i * pi / 3),
        ),
        dashLinesHeavy,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
