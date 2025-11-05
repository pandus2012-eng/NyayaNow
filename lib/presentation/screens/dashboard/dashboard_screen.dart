import 'package:flutter/material.dart';

import '../../../core/routing/app_router.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Dashboard')),
        body: Center(
          child: FilledButton(
            onPressed: () => Navigator.pushNamed(context, AppRoutes.chat),
            child: const Text('Open AI Legal Assistant'),
          ),
        ),
      );
}

