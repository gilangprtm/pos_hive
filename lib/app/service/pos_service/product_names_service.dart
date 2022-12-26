import '../../utils/src/img_string.dart';
import '../service_data.dart';

class ProductNameService {
  static List listProductName = [];

  static saveToLocalStorage() async {
    await mainStorage.put("productname", listProductName);
  }

  static loadDataFromDB() async {
    listProductName = await mainStorage.get("productname") ?? [];
  }

  static addProductNames({
    required String id,
    required String name,
  }) {
    listProductName.add(
      {
        "id": id,
        "name": name,
      },
    );
    saveToLocalStorage();
  }

  static void clearProductNames() {
    listProductName.clear();
    saveToLocalStorage();
  }
}
