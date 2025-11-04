import 'package:flutter/material.dart';
import 'ai_chat_screen.dart';
import 'know_rights_screen.dart';
import 'help_desk_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatelessWidget {
  static const route = 'home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: const Text('NyayaNow')),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [cs.primary.withOpacity(.05), cs.secondaryContainer.withOpacity(.2)],
            begin: Alignment.topLeft, end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: _HomeCard(
                    icon: Icons.smart_toy_outlined,
                    title: 'AI Legal Assistant',
                    onTap: () => Navigator.pushNamed(context, AiChatScreen.route),
                  )),
                  const SizedBox(width: 12),
                  Expanded(child: _HomeCard(
                    icon: Icons.menu_book_outlined,
                    title: 'Know Your Rights',
                    onTap: () => Navigator.pushNamed(context, KnowRightsScreen.route),
                  )),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: _HomeCard(
                    icon: Icons.support_agent_outlined,
                    title: 'Help Desk',
                    onTap: () => Navigator.pushNamed(context, HelpDeskScreen.route),
                  )),
                  const SizedBox(width: 12),
                  Expanded(child: _HomeCard(
                    icon: Icons.person_outline,
                    title: 'Profile & Settings',
                    onTap: () => Navigator.pushNamed(context, ProfileScreen.route),
                  )),
                ],
              ),
              const Spacer(),
              const Text('info@nyayanow.com', style: TextStyle(fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }
}

class _HomeCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  const _HomeCard({required this.icon, required this.title, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(colors: [cs.primary.withOpacity(.15), cs.primaryContainer.withOpacity(.35)]),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 32),
              const SizedBox(height: 8),
              Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }
}
