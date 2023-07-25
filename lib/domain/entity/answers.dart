import 'dart:convert';

class Answers {
  final String reading;
  Answers({
    required this.reading,
  });

  Answers copyWith({
    String? reading,
  }) {
    return Answers(
      reading: reading ?? this.reading,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'reading': reading,
    };
  }

  factory Answers.fromMap(Map<String, dynamic> map) {
    return Answers(
      reading: map['reading'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Answers.fromJson(String source) =>
      Answers.fromMap(json.decode(source));

  @override
  String toString() => 'Answers(reading: $reading)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Answers && other.reading == reading;
  }

  @override
  int get hashCode => reading.hashCode;
}





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
