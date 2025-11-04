import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/locale_provider.dart';

class ProfileScreen extends StatelessWidget {
  static const route = 'profile';
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final current = context.watch<LocaleProvider>().locale.languageCode;

    return Scaffold(
      appBar: AppBar(title: const Text('Profile & Settings')),
      body: ListView(
        children: [
          const ListTile(leading: Icon(Icons.person_outline), title: Text('My Profile')),
          const ListTile(leading: Icon(Icons.assignment_outlined), title: Text('My Cases')),
          ListTile(
            leading: const Icon(Icons.language_outlined),
            title: const Text('Language Settings'),
            trailing: DropdownButton<String>(
              value: current,
              items: const [
                DropdownMenuItem(value: 'en', child: Text('English')),
                DropdownMenuItem(value: 'kn', child: Text('ಕನ್ನಡ')),
                DropdownMenuItem(value: 'hi', child: Text('हिन्दी')),
              ],
              onChanged: (code) {
                if (code != null) context.read<LocaleProvider>().setLocale(Locale(code));
              },
            ),
          ),
          const ListTile(leading: Icon(Icons.info_outline), title: Text('About NyayaNow')),
          const ListTile(leading: Icon(Icons.support_agent_outlined), title: Text('Support')),
        ],
      ),
    );
  }
}
