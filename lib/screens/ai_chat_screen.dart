import 'package:flutter/material.dart';

class AiChatScreen extends StatefulWidget {
  static const route = '/ai';
  const AiChatScreen({super.key});

  @override
  State<AiChatScreen> createState() => _AiChatScreenState();
}

class _AiChatScreenState extends State<AiChatScreen> {
  final _controller = TextEditingController();
  final List<_Msg> _messages = [
    _Msg(text: 'Hi! I am your AI Legal Assistant. How can I help today?', fromBot: true),
  ];

  void _send() {
    final txt = _controller.text.trim();
    if (txt.isEmpty) return;
    setState(() {
      _messages.add(_Msg(text: txt, fromBot: false));
      _messages.add(_Msg(text: 'Thanks! (mock reply) I will route this to the right category.', fromBot: true));
    });
    _controller.clear();
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
              itemCount: _messages.length,
              itemBuilder: (c, i) {
                final m = _messages[i];
                return Align(
                  alignment: m.fromBot ? Alignment.centerLeft : Alignment.centerRight,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                    decoration: BoxDecoration(
                      color: m.fromBot ? Colors.grey.shade200 : Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(m.text),
                  ),
                );
              },
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(child: TextField(controller: _controller, decoration: const InputDecoration(hintText: 'Type your question...'))),
                  const SizedBox(width: 8),
                  FilledButton(onPressed: _send, child: const Icon(Icons.send)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Msg {
  final String text;
  final bool fromBot;
  _Msg({required this.text, required this.fromBot});
}
