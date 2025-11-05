import 'package:flutter/material.dart';

import '../../../core/routing/app_router.dart';
import '../../../core/i18n/app_localizations.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(t.t('app_title', fallback: 'NyayaNow'))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(t.t('choose_language', fallback: 'Choose Language')),
            const SizedBox(height: 16),
            Wrap(spacing: 8, children: [
              OutlinedButton(
                onPressed: () => Navigator.pushReplacementNamed(context, AppRoutes.dashboard),
                child: const Text('English'),
              ),
              OutlinedButton(
                onPressed: () => Navigator.pushReplacementNamed(context, AppRoutes.dashboard),
                child: const Text('??????'),
              ),
              OutlinedButton(
                onPressed: () => Navigator.pushReplacementNamed(context, AppRoutes.dashboard),
                child: const Text('?????'),
              ),
            ])
          ],
        ),
      ),
    );
  }
}

