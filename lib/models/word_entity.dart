class WordEntity {
  final String word;
  final String meaning;
  final String pronunciation;

  WordEntity({required this.word, required this.meaning,required this.pronunciation});

  factory WordEntity.fromJson(Map<String, dynamic> json) {
    return WordEntity(
      word: json['word'],
      meaning: json['meaning'],
      pronunciation: json['pronunciation'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'word': word,
      'meaning': meaning,
      'pronunciation': pronunciation,
    };
  }
}
