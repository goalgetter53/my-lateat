import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../providers/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
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
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Log in',
                      style: GoogleFonts.figtree(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1D2939),
                      ),
                    ),
                    const SizedBox(height: 11),
                    Text(
                      'Access your account and stay connected.',
                      style: GoogleFonts.figtree(
                        fontSize: 16,
                        color: const Color(0xFF667085),
                      ),
                    ),
                    const SizedBox(height: 32),
                    _buildInputField(
                      label: 'Email',
                      controller: _emailController,
                      hintText: 'Enter your email address',
                    ),
                    const SizedBox(height: 16),
                    _buildInputField(
                      label: 'Password',
                      controller: _passwordController,
                      hintText: 'Input password',
                      isPassword: true,
                    ),
                    const SizedBox(height: 16),
                    _buildRememberMeAndForgotPassword(),
                    const SizedBox(height: 32),
                    _buildLoginButton(),
                    const SizedBox(height: 20),
                    _buildDividerWithText(),
                    const SizedBox(height: 20),
                    _buildGoogleSignInButton(context),
                    const SizedBox(height: 32),
                    _buildTermsAndPrivacy(),
                    const SizedBox(height: 16),
                    _buildSignUpSection(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required TextEditingController controller,
    required String hintText,
    bool isPassword = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.figtree(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1D2939),
          ),
        ),
        const SizedBox(height: 8),
        Material(
          elevation: 1,
          shadowColor: Colors.black.withOpacity(0.05),
          borderRadius: BorderRadius.circular(8),
          child: TextField(
            controller: controller,
            obscureText: isPassword,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: GoogleFonts.inter(
                fontSize: 14,
                color: const Color(0xFF98A2B3),
                letterSpacing: -0.1,
              ),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Color(0xFFD0D5DD)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Color(0xFFD0D5DD)),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
              suffixIcon: isPassword
                  ? IconButton(
                      icon: const Icon(Icons.visibility_off,
                          color: Color(0xFF667085)),
                      onPressed: () {
                        // Toggle password visibility
                      },
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRememberMeAndForgotPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: Checkbox(
                value: _rememberMe,
                onChanged: (value) {
                  setState(() {
                    _rememberMe = value ?? false;
                  });
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                side: const BorderSide(color: Color(0xFFD0D5DD), width: 1.5),
                activeColor: const Color(0xFF231849),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'Remember me',
              style: GoogleFonts.figtree(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF1D2939),
              ),
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            // Handle forgot password
          },
          child: Text(
            'Forgot Password?',
            style: GoogleFonts.figtree(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF1D2939),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: () {
        // Handle email/password login
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF5339AD),
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(999),
        ),
        elevation: 1,
        shadowColor: Colors.black.withOpacity(0.05),
      ),
      child: Text(
        'Log in',
        style: GoogleFonts.figtree(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildDividerWithText() {
    return Row(
      children: [
        const Expanded(
          child: Divider(color: Color(0xFFEAECF0), thickness: 1.5),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            'or',
            style: GoogleFonts.figtree(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF667085),
            ),
          ),
        ),
        const Expanded(
          child: Divider(color: Color(0xFFEAECF0), thickness: 1.5),
        ),
      ],
    );
  }

  Widget _buildGoogleSignInButton(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    
    return OutlinedButton(
      onPressed: () async {
        final success = await authProvider.signInWithGoogle();
        if (success && mounted) {
          context.go('/auth/country-selection');
        }
      },
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(double.infinity, 48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(999),
        ),
        side: const BorderSide(color: Color(0xFFD0D5DD)),
        elevation: 1,
        shadowColor: Colors.black.withOpacity(0.05),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            'https://www.google.com/favicon.ico',
            width: 24,
            height: 24,
          ),
          const SizedBox(width: 12),
          Text(
            'Continue with Google',
            style: GoogleFonts.figtree(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1D2939),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTermsAndPrivacy() {
    return Text(
      'By signing up, you agree to our Terms of Service and Privacy Policy, ensuring your information is protected.',
      textAlign: TextAlign.center,
      style: GoogleFonts.figtree(
        fontSize: 12,
        color: const Color(0xFF667085),
        letterSpacing: 0.01,
        height: 1.5,
      ),
    );
  }

  Widget _buildSignUpSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Do not have an Account?',
          style: GoogleFonts.figtree(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF1D2939),
          ),
        ),
        TextButton(
          onPressed: () {
            // Navigate to sign up
          },
          child: Text(
            'Sign up',
            style: GoogleFonts.figtree(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF5339AD),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}