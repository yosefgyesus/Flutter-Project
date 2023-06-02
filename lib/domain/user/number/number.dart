class Number {
  final int id;
  final String number;
  final String meaning;

  Number({
    required this.id,
    required this.number,
    required this.meaning,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'number': number,
      'meaning': meaning,
    };
  }

  factory Number.fromJson(Map<String, dynamic> json) {
    return Number(
      id: json['id'],
      number: json['number'],
      meaning: json['meaning'],
    );
  }
}
