import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:portfolio/utils/statics/credentials.dart';

class CloudService {
  static Future<bool> sendEmail(
      String email, String name, String content) async {
    var body = {"email": email, "name": name, "content": content};
    try {
      var response =
          await http.post(Uri.parse("${functionsURL}sendMail"), body: body);
      if (response.statusCode == 201) return true;
    } catch (e) {}
    return false;
  }
}
