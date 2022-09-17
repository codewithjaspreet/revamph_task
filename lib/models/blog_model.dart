class BlogModel {
  final String imageUrl;
  final String description;
  final DateTime dateTime;
  final String title;
  final String author;

  BlogModel({
    this.imageUrl,
    this.title,
    this.author,
    this.dateTime,
    this.description,
  });

  factory BlogModel.fromJson(Map<String, dynamic> parsedJson) {
    return BlogModel(
      imageUrl: parsedJson['imageUrl'],
      description: parsedJson['description'],
      dateTime: parsedJson['datetime'],
      title: parsedJson['title'],
      author: parsedJson['author'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'author': author,
      'datetime': DateTime.now()
    };
  }
}
