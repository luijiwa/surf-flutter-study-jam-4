import 'dart:convert';
import 'dart:io';

import 'package:surf_practice_magic_ball/domain/entity/answers.dart';

class ApiClient {
  final client = HttpClient();

  Future<List<Answers>> getAnswer() async {
    final url = Uri.parse('https://eightballapi.com/api');
    final request = await client.getUrl(url);
    final response = await request.close();
    final json = await response
        .transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then((v) => jsonDecode(v) as List<dynamic>);
    final result =
        json.map((dynamic e) => Answers.fromJson(e as String)).toList();
    return result;
  }
}
