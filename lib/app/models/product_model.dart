class ProductModel {
  ProductModel({
    this.id,
    this.photo,
    this.productName,
    this.price,
    this.description,
    this.qty,
  });

  String? id;
  String? photo;
  String? productName;
  double? price;
  String? description;
  int? qty;
  static ProductModel fromDynamic(dynamic json) => ProductModel(
        id: json["id"],
        photo: json["photo"],
        productName: json["product_name"],
        price: json["price"],
        description: json["description"],
        qty: json["qty"],
      );
}
