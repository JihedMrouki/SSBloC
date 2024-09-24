import 'dart:convert';

class Jokes {
  final String type;
  final String setup;
  final String punchline;
  final int id;

  Jokes({
    required this.type,
    required this.setup,
    required this.punchline,
    required this.id,
  });

  factory Jokes.fromJson(String str) => Jokes.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Jokes.fromMap(Map<String, dynamic> json) => Jokes(
        type: json["type"],
        setup: json["setup"],
        punchline: json["punchline"],
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "type": type,
        "setup": setup,
        "punchline": punchline,
        "id": id,
      };
}
