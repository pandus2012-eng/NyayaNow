import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static const route = 'profile';
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile & Settings')),
      body: ListView(
        children: const [
          ListTile(leading: Icon(Icons.person_outline), title: Text('My Profile')),
          ListTile(leading: Icon(Icons.assignment_outlined), title: Text('My Cases')),
          ListTile(leading: Icon(Icons.language_outlined), title: Text('Language Settings')),
          ListTile(leading: Icon(Icons.info_outline), title: Text('About NyayaNow')),
          ListTile(leading: Icon(Icons.support_agent_outlined), title: Text('Support')),
        ],
      ),
    );
  }
}
