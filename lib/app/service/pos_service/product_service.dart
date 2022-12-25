import 'package:uuid/uuid.dart';

import '../../models/product_model.dart';
import '../service_data.dart';

class ProductService {
  static List productList = [];
  static List<ProductModel> products = [];

  static saveToLocalStorage() async {
    await mainStorage.put("products", productList);
    loadDataFromDB();
  }

  static loadDataFromDB() async {
    productList = await mainStorage.get("products") ?? [];
    products = productList.map((e) => ProductModel.fromDynamic(e)).toList();
  }

  static clearQty() async {
    for (var product in productList) {
      product["qty"] = 0;
    }
  }

  static double get totalbuy {
    var productTotal = 0.0;
    for (var product in productList) {
      productTotal += product["qty"] * product["buyprice"];
    }
    return productTotal;
  }

  static double get totalsell {
    var productTotal = 0.0;
    for (var product in productList) {
      productTotal += product["qty"] * product["sellprice"];
    }
    return productTotal;
  }

  static addProduct({
    required String photo,
    required String productName,
    required double buyprice,
    required double sellprice,
    required String description,
    required String categorie,
  }) {
    productList.add({
      "id": const Uuid().v4(),
      "photo": photo,
      "product_name": productName,
      "buyprice": buyprice,
      "sellprice": sellprice,
      "description": description,
      "categorie": categorie,
      "stock": 0,
    });
    saveToLocalStorage();
  }

  static updateProduct({
    required String id,
    required String photo,
    required String productName,
    required double buyprice,
    required double sellprice,
    required String description,
    required String categorie,
    required int stock,
  }) {
    var targetIndex = productList.indexWhere((product) => product["id"] == id);
    productList[targetIndex] = {
      "id": id,
      "photo": photo,
      "product_name": productName,
      "buyprice": buyprice,
      "sellprice": sellprice,
      "description": description,
      "categorie": categorie,
      "stock": stock,
    };
    saveToLocalStorage();
  }

  static deleteProduct(String id) {
    productList.removeWhere((product) => product["id"] == id);
    saveToLocalStorage();
  }

  static addStock({
    required String id,
    required int qty,
  }) {
    var targetIndex = productList.indexWhere((product) => product["id"] == id);
    var currentStock = productList[targetIndex]["stock"];
    var newStock = currentStock + qty;
    productList[targetIndex]["stock"] = newStock;

    saveToLocalStorage();
  }

  static reduceStock({
    required String id,
    required int qty,
  }) {
    var targetIndex = productList.indexWhere((product) => product["id"] == id);
    var currentStock = productList[targetIndex]["stock"];
    var newStock = currentStock - qty;
    productList[targetIndex]["stock"] = newStock;

    saveToLocalStorage();
  }

  static void clearProduct() {
    productList.clear();
    saveToLocalStorage();
  }
}
