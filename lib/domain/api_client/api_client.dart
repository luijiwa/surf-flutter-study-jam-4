import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:surf_practice_magic_ball/domain/entity/answers.dart';

//Класс для работы с отправкой запроса, получения ответа и декодирования и отлавливания ошибок
class ApiClient {
  final client = HttpClient();

  Future<Answers> getAnswer() async {
    try {
      final url = Uri.parse('https://eightballapi.com/api');
      final response = await http.get(url);
      switch (response.statusCode) {
        // если всё хорошо
        case 200:
          Map<String, dynamic> data = jsonDecode(response.body);
          final answers = Answers.fromMap(data);
          return answers;

        // если всё плохо:
        default:
          throw Exception(response.reasonPhrase);
      }
    } on Exception catch (_) {
      rethrow;
    }
  }
}
