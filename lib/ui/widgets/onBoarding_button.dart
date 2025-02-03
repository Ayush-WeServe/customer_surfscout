import 'package:flutter/material.dart';

class TriangularButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color color;
  final IconData icon;

  const TriangularButton({
    super.key,
    required this.onPressed,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TriangleClipper(),
      child: Material(
        color: color,
        child: InkWell(
          onTap: onPressed,
          child: Container(
            width: 50,
            height: 50,
            alignment: Alignment.center,
            child: Icon(
              icon,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),
      ),
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double curveOffset = size.width * 0.1;

    path.moveTo(curveOffset, size.height); // Bottom-left corner
    path.lineTo(size.width - curveOffset, size.height / 2); // Right tip
    path.lineTo(curveOffset, 0); // Top-left corner
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
