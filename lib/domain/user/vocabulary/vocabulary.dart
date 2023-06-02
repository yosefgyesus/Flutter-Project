class Vocabulary {
  final int id;
  final String word;
  final String meaning;

  Vocabulary({
    required this.id,
    required this.word,
    required this.meaning,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'word': word,
      'meaning': meaning,
    };
  }

  factory Vocabulary.fromMap(Map<String, dynamic> map) {
    return Vocabulary(
      id: map['id'],
      word: map['word'],
      meaning: map['meaning'],
    );
  }

  // I set this like that of the above one for the vocabulary service file and for the other files
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'word': word,
      'meaning': meaning,
    };
  }

  factory Vocabulary.fromJson(Map<String, dynamic> json) {
    return Vocabulary(
      id: json['id'],
      word: json['word'],
      meaning: json['meaning'],
    );
  }
}

// Other methods and properties of the Vocabulary class
