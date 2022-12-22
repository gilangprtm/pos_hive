import '../../utils/src/img_string.dart';
import '../service_data.dart';

class CategoriesService {
  static List categories = [];

  static saveToLocalStorage() async {
    await mainStorage.put("categories", categories);
  }

  static loadDataFromDB() async {
    categories = await mainStorage.get("categories") ?? [];
  }

  static void addCategorie({
    required String tag,
  }) {
    categories.add(
      {
        "icon": ImgString.product,
        "label": tag,
      },
    );
    saveToLocalStorage();
  }

  static void clearCategories() {
    categories.clear();
    saveToLocalStorage();
  }
}
