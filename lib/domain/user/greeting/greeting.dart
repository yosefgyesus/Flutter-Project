class Greeting {
  final int id;
  final String greeting;
  final String meaning;
  final String example;

  Greeting({
    required this.id,
    required this.greeting,
    required this.meaning,
    required this.example,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'greeting': greeting,
      'meaning': meaning,
      'example': example,
    };
  }

  factory Greeting.fromJson(Map<String, dynamic> json) {
    return Greeting(
      id: json['id'],
      greeting: json['greeting'],
      meaning: json['meaning'],
      example: json['example'],
    );
  }
}
