class Flashcard {
  int? id;
  final String word;
  final String image;
  bool isFavorite;

  Flashcard({
    this.id,
    required this.word,
    required this.image,
    this.isFavorite = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'word': word,
      'image': image,
      'favorite': isFavorite ? 1 : 0,
    };
  }

  factory Flashcard.fromMap(Map<String, dynamic> map) {
    return Flashcard(
      id: map['id'],
      word: map['word'],
      image: map['image'],
      isFavorite: map['favorite'] == 1,
    );
  }
}
