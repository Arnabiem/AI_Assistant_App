import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:ai_assistant/constraints/constants.dart';
import 'package:http/http.dart';

class APIs {
  // to get ans from chatgpt
  static Future<String> getanswer(String question) async {    
    // post->send data to api
    try {
      final res=await post(Uri.parse("https://api.openai.com/v1/chat/completions"),
    headers: {
      HttpHeaders.contentTypeHeader:'application/json',
      HttpHeaders.authorizationHeader:'Bearer $apikey'
    },
    body: jsonEncode({
      "model": "gpt-3.5-turbo",
      // "max_token":2000,
      "temperature":0,
    "messages": [
      {
        "role": "user",
        "content": question
      },
    ]
    })
    );
    final data=jsonDecode(res.body);
    log('res:$data');
    return data['choices'][0]['message']['content'];
    } catch (e) {
      log('error:$e');
      return 'Something went wrong Please try again later';
    }
  }
// using lexica api for ai image generation(free & fast)
static Future<List<String>> searchAiImages(String prompt) async {
    try {
      final res =
          await get(Uri.parse('https://lexica.art/api/v1/search?q=$prompt'));

      final data = jsonDecode(res.body);

      
      return List.from(data['images']).map((e) => e['src'].toString()).toList();
    } catch (e) {
      log('searchAiImagesE: $e');
      return [];
    }
  }
}