import 'package:flutter/material.dart';
import 'location_screen.dart';

class IdentityScreen extends StatefulWidget {
  static const route = '/identity';
  const IdentityScreen({super.key});

  @override
  State<IdentityScreen> createState() => _IdentityScreenState();
}

class _IdentityScreenState extends State<IdentityScreen> {
  String? ageBand;
  String? gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Age category', style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                ChoiceChip(label: const Text('Minor (<18)'), selected: ageBand == 'minor', onSelected: (_) => setState(() => ageBand = 'minor')),
                ChoiceChip(label: const Text('Adult (18–59)'), selected: ageBand == 'adult', onSelected: (_) => setState(() => ageBand = 'adult')),
                ChoiceChip(label: const Text('Senior (60+)'), selected: ageBand == 'senior', onSelected: (_) => setState(() => ageBand = 'senior')),
              ],
            ),
            const SizedBox(height: 16),
            const Text('Gender', style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                ChoiceChip(label: const Text('Female'), selected: gender == 'f', onSelected: (_) => setState(() => gender = 'f')),
                ChoiceChip(label: const Text('Male'), selected: gender == 'm', onSelected: (_) => setState(() => gender = 'm')),
                ChoiceChip(label: const Text('Other / Prefer not to say'), selected: gender == 'o', onSelected: (_) => setState(() => gender = 'o')),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: (ageBand != null && gender != null) ? () => Navigator.pushNamed(context, LocationScreen.route) : null,
              child: const Padding(padding: EdgeInsets.symmetric(vertical: 14), child: Text('Continue')),
            ),
          ],
        ),
      ),
    );
  }
}
