class WordEntity {
  final String wordID;
  final String word;
  final String meaning;
  final String pronunciation;
  final String audioUrl;

  WordEntity({required this.wordID, required this.word, required this.meaning,required this.pronunciation,required this.audioUrl});

  factory WordEntity.fromJson(Map<String, dynamic> json) {
    return WordEntity(
      wordID: json['wordID'],
      word: json['word'],
      meaning: json['meaning'],
      pronunciation: json['pronunciation'],
      audioUrl: json['audioUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'wordID': wordID,
      'word': word,
      'meaning': meaning,
      'pronunciation': pronunciation,
      'audioUrl': audioUrl,
    };
  }
}
