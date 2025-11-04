import 'package:flutter/material.dart';
import 'identity_screen.dart';

class LanguageScreen extends StatelessWidget {
  static const route = '/language';
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final langs = ['English', 'ಕನ್ನಡ (Kannada)', 'हिन्दी (Hindi)'];
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
                onPressed: () => Navigator.pushNamed(context, IdentityScreen.route),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: Text(l),
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
