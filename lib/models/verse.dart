class Verse {
  final int chapter;
  final int verse;
  final String text;
  final String meaning;

  Verse({
    required this.chapter,
    required this.verse,
    required this.text,
    required this.meaning,
  });

  factory Verse.fromJson(Map<String, dynamic> json) {
    String englishMeaning = 'Translation not found.';
    var translations = json['translations'] as List<dynamic>?;
    if (translations != null) {
      var englishTranslation = translations.firstWhere(
        (t) => t['language'] == 'english',
        orElse: () => null,
      );
      if (englishTranslation != null) {
        englishMeaning = englishTranslation['description'];
      }
    }

    return Verse(
      chapter: json['chapter_number'],
      verse: json['verse_number'],
      text: json['text'],
      meaning: englishMeaning,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Verse &&
        other.chapter == chapter &&
        other.verse == verse;
  }

  @override
  int get hashCode => chapter.hashCode ^ verse.hashCode;
}
