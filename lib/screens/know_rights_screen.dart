import 'package:flutter/material.dart';

class KnowRightsScreen extends StatelessWidget {
  static const route = 'rights';
  const KnowRightsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = const [
      'Right to Legal Aid (Article 39A)',
      'Right to Information (RTI Act)',
      'Consumer Protection Basics',
      'Motor Accident Claim Basics',
      'Domestic Violence Protection Basics',
      'Senior Citizen Maintenance Act Basics',
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Know Your Rights')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (_, i) => ListTile(
          leading: const Icon(Icons.book_outlined),
          title: Text(items[i]),
          subtitle: const Text('Tap to read a short summary.'),
          onTap: () {},
        ),
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemCount: items.length,
      ),
    );
  }
}
