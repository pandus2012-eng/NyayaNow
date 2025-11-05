import 'package:flutter/material.dart';

import '../../../data/services/ai_service.dart';

class AiChatScreen extends StatefulWidget {
  const AiChatScreen({super.key});

  @override
  State<AiChatScreen> createState() => _AiChatScreenState();
}

class _AiChatScreenState extends State<AiChatScreen> {
  final _controller = TextEditingController();
  final _msgs = <({String role, String text})>[];
  late final AiService _ai;

  @override
  void initState() {
    super.initState();
    _ai = AiService(baseUrl: 'https://ai.nyayanow.org');
  }

  Future<void> _ask() async {
    final query = _controller.text.trim();
    if (query.isEmpty) return;

    setState(() => _msgs.add((role: 'user', text: query)));
    _controller.clear();

    final answer = await _ai.ask(
      query: query,
      contextDocs: const ['Consumer Protection Act 2019 Section 35 ...'],
      localeCode: 'en',
    );

    setState(() => _msgs.add((role: 'assistant', text: answer)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AI Legal Assistant')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _msgs.length,
              itemBuilder: (_, index) {
                final message = _msgs[index];
                final isUser = message.role == 'user';
                return Align(
                  alignment:
                      isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isUser
                          ? Colors.deepPurple.withAlpha((255 * 0.12).round())
                          : Colors.black.withAlpha((255 * 0.12).round()),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(message.text),
                  ),
                );
              },
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText: 'Ask a legal question...',
                        border: OutlineInputBorder(),
                      ),
                      onSubmitted: (_) => _ask(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  FilledButton(
                    onPressed: _ask,
                    child: const Text('Ask'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

