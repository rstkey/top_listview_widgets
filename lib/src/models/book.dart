class Book {
  final String title;
  final String name;
  final String urlAvatar;

  const Book(
      {required this.title, required this.name, required this.urlAvatar});

  static Book fromJson(json) => Book(
        title: json['title'],
        name: json['name'],
        urlAvatar: json['urlAvatar'],
      );
}
