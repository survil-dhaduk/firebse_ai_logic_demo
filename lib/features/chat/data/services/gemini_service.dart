import 'package:firebase_ai/firebase_ai.dart';


class GeminiService {
  final _model = FirebaseAI.googleAI()
      .generativeModel(model: 'gemini-2.5-flash');

  Future<String> sendMessage(String message) async {
    try {
      final prompt = [Content.text(message)];
      final response = await _model.generateContent(prompt);

      return response.text ?? "⚠️ No response from Gemini";
    } catch (e) {
      return "❌ Error: $e";
    }
  }
}