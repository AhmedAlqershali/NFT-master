class CreateProductsModel {
  int? id;
  String? name;
  int? price;
  String? description;

  String? productPath;
  String? subImagePath;

  CreateProductsModel({
    this.id,
    this.name,
    this.price,
    this.description,

    this.productPath,
    this.subImagePath,

  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,

      'productPath': productPath,
      'subImagePath': subImagePath,

    };
  }

  factory CreateProductsModel.fromJson(Map<String, dynamic> json) {
    return CreateProductsModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      description: json['description'],
      productPath: json['productPath'],
      subImagePath: json['subImagePath'],

    );
  }
}
