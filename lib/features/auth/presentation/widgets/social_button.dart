import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SocialButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(999),
        ),
        side: const BorderSide(
          color: Color(0xFFD0D5DD),
          width: 1,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: CustomPaint(
              painter: GoogleLogoPainter(),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            'Continue with Google',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1D2939),
            ),
          ),
        ],
      ),
    );
  }
}

class GoogleLogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);

    // Google logo colors
    const colors = {
      'yellow': Color(0xFFFFC107),
      'red': Color(0xFFFF3D00),
      'green': Color(0xFF4CAF50),
      'blue': Color(0xFF1976D2),
    };

    final paint = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    // Draw the Google "G"
    paint.color = colors['blue']!;
    canvas.drawArc(rect, 0, 2 * 3.14159, false, paint);

    paint.color = Colors.white;
    canvas.drawArc(
      rect.deflate(size.width * 0.15),
      0,
      2 * 3.14159,
      false,
      paint,
    );

    paint.color = colors['blue']!;
    canvas.drawRect(
      Rect.fromLTWH(
        size.width * 0.6,
        size.height * 0.35,
        size.width * 0.4,
        size.height * 0.3,
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}