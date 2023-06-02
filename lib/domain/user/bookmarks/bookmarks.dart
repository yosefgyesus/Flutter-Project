class Bookmark {
  final int? id;
  final String word;
  final String meaning;

  Bookmark({
    this.id,
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

  factory Bookmark.fromJson(Map<String, dynamic> json) {
    return Bookmark(
      id: json['id'],
      word: json['word'],
      meaning: json['meaning'],
    );
  }
}
