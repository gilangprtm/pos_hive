class ProductModel {
  ProductModel({
    this.id,
    this.photo,
    this.productname,
    this.buyprice,
    this.sellprice,
    this.description,
    this.stock,
  });

  String? id;
  String? photo;
  String? productname;
  double? buyprice;
  double? sellprice;
  String? description;
  int? stock;
  static ProductModel fromDynamic(dynamic json) => ProductModel(
        id: json["id"],
        photo: json["photo"],
        productname: json["product_name"],
        buyprice: json["buyprice"],
        sellprice: json["sellprice"],
        description: json["description"],
        stock: json["stock"],
      );
}
