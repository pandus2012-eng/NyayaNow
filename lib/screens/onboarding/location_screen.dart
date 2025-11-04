import 'package:flutter/material.dart';
import '../home_screen.dart';

class LocationScreen extends StatefulWidget {
  static const route = 'location';
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String? state, district, taluk;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Location')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'State'),
              items: const [
                DropdownMenuItem(value: 'Karnataka', child: Text('Karnataka')),
                DropdownMenuItem(value: 'Maharashtra', child: Text('Maharashtra')),
                DropdownMenuItem(value: 'Tamil Nadu', child: Text('Tamil Nadu')),
              ],
              onChanged: (v) => setState(() => state = v),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'District'),
              items: const [
                DropdownMenuItem(value: 'Bengaluru Urban', child: Text('Bengaluru Urban')),
                DropdownMenuItem(value: 'Mysuru', child: Text('Mysuru')),
              ],
              onChanged: (v) => setState(() => district = v),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Taluk'),
              items: const [
                DropdownMenuItem(value: 'Yelahanka', child: Text('Yelahanka')),
                DropdownMenuItem(value: 'Anekal', child: Text('Anekal')),
              ],
              onChanged: (v) => setState(() => taluk = v),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: (state != null && district != null && taluk != null)
                  ? () => Navigator.pushReplacementNamed(context, HomeScreen.route)
                  : null,
              child: const Padding(padding: EdgeInsets.symmetric(vertical: 14), child: Text('Continue')),
            ),
          ],
        ),
      ),
    );
  }
}
