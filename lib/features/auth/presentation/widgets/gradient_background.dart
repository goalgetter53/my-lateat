import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: -150,
          top: -150,
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFB863F0).withOpacity(0.6),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFB863F0).withOpacity(0.3),
                  blurRadius: 150,
                  spreadRadius: 0,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: -150,
          bottom: -150,
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF32CAF8).withOpacity(0.3),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF32CAF8).withOpacity(0.15),
                  blurRadius: 150,
                  spreadRadius: 0,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}