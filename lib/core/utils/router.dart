import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../features/auth/presentation/pages/login_screen.dart';
import '../../features/auth/presentation/pages/country_selection_screen.dart';
import '../../features/auth/presentation/providers/auth_provider.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/onboarding/presentation/pages/onboarding_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/onboarding',
  redirect: (context, state) {
    final auth = Provider.of<AuthProvider>(context, listen: false);
    final isAuthenticated = auth.isAuthenticated;
    final isOnboarding = state.fullPath == '/onboarding';
    final isAuthRoute = state.fullPath?.startsWith('/auth') ?? false;

    // Allow access to onboarding
    if (isOnboarding) return null;

    // If not authenticated and not on an auth route, redirect to login
    if (!isAuthenticated && !isAuthRoute) return '/auth/login';

    // If authenticated and on an auth route, redirect to home
    if (isAuthenticated && isAuthRoute) return '/';

    return null;
  },
  routes: [
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: '/auth/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/auth/country-selection',
      builder: (context, state) => const CountrySelectionScreen(),
    ),
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Text('Error: ${state.error}'),
    ),
  ),
);