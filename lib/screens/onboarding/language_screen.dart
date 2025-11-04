import 'package:flutter/material.dart';
import 'identity_screen.dart';

class LanguageScreen extends StatelessWidget {
  static const route = '/language';

  /// Optional callback used when the screen is presented as a modal/home
  /// to allow the app to change its runtime locale. If null the screen
  /// will navigate to the next onboarding route instead.
  final void Function(String languageCode)? onPick;

  const LanguageScreen({super.key, this.onPick});

  @override
  Widget build(BuildContext context) {
    final langs = <Map<String, String>>[
      {'label': 'English', 'code': 'en'},
      {'label': 'ಕನ್ನಡ (Kannada)', 'code': 'kn'},
      {'label': 'हिन्दी (Hindi)', 'code': 'hi'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Choose Language')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Select your preferred language:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            const SizedBox(height: 12),
            ...langs.map((l) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: OutlinedButton(
                    onPressed: () {
                      final code = l['code']!;
                      if (onPick != null) {
                        onPick!(code);
                      } else {
                        // If no callback is provided, continue onboarding.
                        Navigator.pushNamed(context, IdentityScreen.route);
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: Text(l['label']!),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
