class Collections {
  int? id;
  String? name;
  String? imagePath;
  int? productsCount;

  Collections({this.id, this.name, this.imagePath, this.productsCount});

  factory Collections.fromJson(json) {
    return Collections(
        id: json['id'],
        name: json['name'],
        imagePath: json['imagePath'],
    productsCount: json['productsCount'],
    );

  }

}