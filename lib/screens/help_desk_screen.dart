import 'package:flutter/material.dart';

class HelpDeskScreen extends StatelessWidget {
  static const route = '/helpdesk';
  const HelpDeskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Help Desk')),
      body: const Center(
        child: Text('Coming soon: local NGO & lawyer directory.\nWe will connect you to verified legal help in your taluk.'),
      ),
    );
  }
}
