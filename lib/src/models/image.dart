class Image {
  final String? description;
  final String? altDescription;
  final String? raw;

  const Image({this.description, this.altDescription, this.raw});

  static Image fromJson(json) => Image(
        description: json['description'],
        altDescription: json['altDescription'],
        raw: json['urls']['small'],
      );
}
