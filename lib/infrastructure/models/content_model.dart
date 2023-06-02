class ContentModel {
  final String id; // Add the id property
  final String word;
  final String meaning;

  ContentModel({
    required this.id,
    required this.word,
    required this.meaning,
  });

  factory ContentModel.fromJson(Map<String, dynamic> json) {
    return ContentModel(
      id: json['id'],
      word: json['word'],
      meaning: json['meaning'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'word': word,
      'meaning': meaning,
    };
  }
}
