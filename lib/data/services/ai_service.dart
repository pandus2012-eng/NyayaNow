class AiService {
  final String baseUrl;
  AiService({required this.baseUrl});

  // TODO: Implement streamed responses with your AI gateway (RAG)
  Future<String> ask({
    required String query,
    required List<String> contextDocs,
    required String localeCode,
  }) async {
    // Stub: call your gateway and return text + citations
    await Future.delayed(const Duration(milliseconds: 200));
    return 'This is a sample AI answer with citations [IPC 420].';
  }
}

