import 'dart:developer';

import 'package:appwrite/appwrite.dart';

import '../constraints/constants.dart';

// appwrite integration 
class AppWrite {
  static final _client = Client();
  static final _database = Databases(_client);

  static void init() {
    _client
        .setEndpoint('https://cloud.appwrite.io/v1')
        .setProject('65ab748ce33ba07abf48')
        .setSelfSigned(status: true);
    getApiKey();
  }

  static Future<String> getApiKey() async {
    try {
      final d = await _database.getDocument(
          databaseId: 'AIDatabase',
          collectionId: 'ApiKey',
          documentId: 'chatgptKey');

      apikey=d.data['apiKey'];
      log(apikey);
      return apikey;
    } catch (e) {
      log('$e');
      return '';
    }
  }
}