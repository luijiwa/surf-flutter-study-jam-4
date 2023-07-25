import 'package:flutter/material.dart';
import 'package:surf_practice_magic_ball/domain/api_client/api_client.dart';
import 'package:surf_practice_magic_ball/domain/entity/answers.dart';

class MagicBallScreenModel extends ChangeNotifier {
  Answers? _answer;
  Answers? get answer => _answer;

  double _opacity = 0.0;
  double get opacity => _opacity;

//Функция меняющая прозрачность
  Future<void> changeOpacity() async {
    if (_answer != null) {
      _answer = null;
      _opacity = 0.0;
    } else {
      _opacity = 1.0;
    }
    notifyListeners();
  }

//Функция узнаёт прозрачность отправляет в changeOpacity если == 0 и запускает отправку get запроса
  Future<void> fetchAnswer() async {
    if (_opacity == 0.0) {
      changeOpacity();
    } else {
      final answer = await ApiClient().getAnswer();
      _answer = answer;
    }

    notifyListeners();
  }
}


//Не успел реализовать swich с переводом всех вариантов на Русский Язык 
//
// const positive = [ 
//   'It is Certain.', 
//   'It is decidedly so.', 
//   'Without a doubt.', 
//   'Yes definitely.', 
//   'You may rely on it.', 
//   'As I see it, yes.', 
//   'Most likely.',  
//   'Outlook good.',
//   'Yes.',
//   'Signs point to yes.'
// ];

// const neutral = [
//   'Reply hazy, try again.',
//   'Ask again later.',
//   'Better not tell you now.',
//   'Cannot predict now.',
//   'Concentrate and ask again.'
// ];

// const negative = [
//   "Don't count on it.",
//   'My reply is no.',
//   'My sources say no.',
//   'Outlook not so good.',
//   'Very doubtful.'
// ];
