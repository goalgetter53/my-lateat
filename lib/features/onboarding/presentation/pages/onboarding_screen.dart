import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5339AD),
      body: SafeArea(
        child: Stack(
          children: [
            // Small decorative circles
            Positioned(
              top: MediaQuery.of(context).size.height * 0.15,
              left: 20,
              child: _buildDecorativeCircle(
                color: const Color(0xFF7A5AF8),
                size: 12,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.3,
              right: 30,
              child: _buildDecorativeCircle(
                color: const Color(0xFF51BC6F),
                size: 8,
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.4,
              right: 40,
              child: _buildDecorativeCircle(
                color: const Color(0xFFFB6514),
                size: 10,
              ),
            ),
            // Blurred decorative circles
            Positioned(
              top: MediaQuery.of(context).size.height * 0.25,
              left: 50,
              child: _buildBlurredCircle(
                color: const Color(0xFFEE46BC),
                size: 20,
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.35,
              right: 60,
              child: _buildBlurredCircle(
                color: const Color(0xFF2E90FA),
                size: 16,
              ),
            ),
            // Background gradient circles
            Positioned(
              top: MediaQuery.of(context).size.height * 0.3,
              right: -100,
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
                      spreadRadius: 50,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: -50,
              left: -100,
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
                      spreadRadius: 50,
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                // Logo
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    'PulmoFit.',
                    style: GoogleFonts.figtree(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Icons and Healthy Life Label
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Meditation Icon
                      Positioned(
                        left: 50,
                        top: MediaQuery.of(context).size.height * 0.2,
                        child: _buildCircleIcon(
                          color: const Color(0xFFFEC633),
                          iconColor: const Color(0xFF6B4D00),
                          icon: Icons.self_improvement,
                          size: 100,
                        ),
                      ),
                      // Lungs Icon
                      Positioned(
                        right: 50,
                        top: MediaQuery.of(context).size.height * 0.15,
                        child: _buildCircleIcon(
                          color: const Color(0xFF6DC786),
                          iconColor: const Color(0xFF104820),
                          icon: Icons.air,
                          size: 110,
                        ),
                      ),
                      // Sleep Icon
                      Positioned(
                        bottom: MediaQuery.of(context).size.height * 0.35,
                        left: MediaQuery.of(context).size.width * 0.3,
                        child: _buildCircleIcon(
                          color: const Color(0xFFD2606E),
                          iconColor: const Color(0xFF4F0710),
                          icon: Icons.nightlight_round,
                          size: 90,
                        ),
                      ),
                      // Healthy Life Label with Blur
                      ClipRRect(
                        borderRadius: BorderRadius.circular(32),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 34, sigmaY: 34),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.09),
                              borderRadius: BorderRadius.circular(32),
                            ),
                            child: Text(
                              'Healthy life',
                              style: GoogleFonts.figtree(
                                color: Colors.white,
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Bottom Card
                Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Breathe better, sleep deeper! 💤',
                        style: GoogleFonts.figtree(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF1D2939),
                          height: 1.25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Join the ultimate lung health & sleep tracking platform designed to help you breathe easier and sleep smarter.',
                        style: GoogleFonts.figtree(
                          fontSize: 14,
                          color: const Color(0xFF667085),
                          height: 1.4,
                          letterSpacing: -0.3,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 32),
                      InkWell(
                        onTap: () => context.go('/auth/country-selection'),
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(20, 10, 4, 10),
                          decoration: BoxDecoration(
                            color: const Color(0xFF5339AD),
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Get started',
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: -0.3,
                                ),
                              ),
                              Container(
                                width: 40,
                                height: 40,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.arrow_forward,
                                  color: Color(0xFF5339AD),
                                  size: 24,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircleIcon({
    required Color color,
    required Color iconColor,
    required IconData icon,
    required double size,
  }) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 8,
            offset: const Offset(0, 5),
            spreadRadius: -2,
          ),
        ],
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: size * 0.5,
      ),
    );
  }

  Widget _buildDecorativeCircle({
    required Color color,
    required double size,
  }) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildBlurredCircle({
    required Color color,
    required double size,
  }) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.5),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
    );
  }
}