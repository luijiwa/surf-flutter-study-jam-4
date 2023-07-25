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
  String toString() => reading;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Answers && other.reading == reading;
  }

  @override
  int get hashCode => reading.hashCode;
}
