import 'package:flutter/material.dart';

import '../../presentation/screens/chat/ai_chat_screen.dart';
import '../../presentation/screens/dashboard/dashboard_screen.dart';
import '../../presentation/screens/onboarding/onboarding_screen.dart';
import '../../presentation/screens/profile/profile_screen.dart';
import '../../presentation/screens/splash/splash_screen.dart';

class AppRoutes {
  static const splash = '/';
  static const onboarding = '/onboarding';
  static const dashboard = '/dashboard';
  static const chat = '/chat';
  static const profile = '/profile';

  static final Map<String, WidgetBuilder> map = {
    splash: (_) => const SplashScreen(),
    onboarding: (_) => const OnboardingScreen(),
    dashboard: (_) => const DashboardScreen(),
    chat: (_) => const AiChatScreen(),
    profile: (_) => const ProfileScreen(),
  };
}

