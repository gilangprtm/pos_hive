import 'package:pos_hive/app/utils/helpers/app_format.dart';

class ProductModel {
  ProductModel({
    this.id,
    this.photo,
    this.productname,
    this.buyprice,
    this.sellprice,
    this.description,
    this.categorie,
    this.stock,
    this.qty,
  });

  String? id;
  String? photo;
  String? productname;
  double? buyprice;
  double? sellprice;
  String? description;
  String? categorie;
  int? stock;
  int? qty;
  static ProductModel fromDynamic(dynamic json) => ProductModel(
        id: json["id"],
        photo: json["photo"],
        productname: json["product_name"],
        buyprice: json["buyprice"],
        sellprice: json["sellprice"],
        description: json["description"],
        categorie: json["categorie"],
        stock: json["stock"],
        qty: json["qty"],
      );
}

class OrderModel {
  OrderModel({
    this.createdAt,
    this.item,
    this.total,
  });
  DateTime? createdAt;
  List<ProductModel>? item;
  double? total;

  static OrderModel fromDynamic(dynamic dynamicData) {
    final model = OrderModel();

    model.createdAt = AppFormat.stringToDateTime(dynamicData['created_at']);
    if (dynamicData['items'] != null) {
      final detailT = dynamicData['items'] as List;
      model.item = [];
      for (var i = 0; i < detailT.length; i++) {
        model.item!.add(ProductModel.fromDynamic(detailT[i]));
      }
    }
    model.total = AppFormat.dynamicToDouble(dynamicData['total']);

    return model;
  }
}

class ProductNameModel {
  ProductNameModel({
    this.id,
    this.productname,
    this.qty,
  });

  String? id;

  String? productname;

  int? qty;
  static ProductNameModel fromDynamic(dynamic json) => ProductNameModel(
        id: json["id"],
        productname: json["product_name"],
        qty: json["qty"],
      );
}
