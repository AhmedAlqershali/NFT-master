class CollectionsDetailsModel {
  int? collectionId;
  String? collectionName;
  String? collectionImagePath;
  int? collectionProductsCount;

  CollectionsDetailsModel({this.collectionId, this.collectionName, this.collectionImagePath, this.collectionProductsCount});

  factory CollectionsDetailsModel.fromJson(json) {
    return CollectionsDetailsModel(
      collectionId: json['collectionId'],
      collectionName: json['collectionName'],
      collectionImagePath: json['collectionImagePath'],
      collectionProductsCount: json['collectionProductsCount'],
    );

  }

}