import 'package:flutter/material.dart';

class SerratedEdgeClipper extends CustomClipper<Path> {
  final double triangleWidth;
  final double triangleHeight;

  const SerratedEdgeClipper({
    this.triangleWidth = 10.0,
    this.triangleHeight = 8.0,
  });

  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - triangleHeight);

    double x = 0;
    while (x < size.width) {
      x += triangleWidth / 2;
      path.lineTo(x, size.height);
      x += triangleWidth / 2;
      path.lineTo(x, size.height - triangleHeight);
    }

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
