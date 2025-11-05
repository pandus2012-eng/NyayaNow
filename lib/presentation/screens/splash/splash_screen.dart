import 'package:flutter/material.dart';

import '../../../core/routing/app_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 900), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacementNamed(AppRoutes.onboarding);
    });
  }

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(child: Text('NyayaNow')),
      );
}

