import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/locale_provider.dart';

class LanguageSelectionScreen extends StatelessWidget {
  const LanguageSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localeProvider = context.read<LocaleProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Select Language')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _langButton(context, 'English', 'en', localeProvider),
            const SizedBox(height: 20),
            _langButton(context, 'ಕನ್ನಡ (Kannada)', 'kn', localeProvider),
            const SizedBox(height: 20),
            _langButton(context, 'हिन्दी (Hindi)', 'hi', localeProvider),
          ],
        ),
      ),
    );
  }

  Widget _langButton(
    BuildContext context,
    String label,
    String code,
    LocaleProvider provider,
  ) {
    return ElevatedButton(
      onPressed: () async {
        provider.setLocale(Locale(code)); // call function correctly
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Language changed to ${code.toUpperCase()}'),
            duration: const Duration(seconds: 2),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(200, 50),
        textStyle: const TextStyle(fontSize: 18),
      ),
      child: Text(label),
    );
  }
}
