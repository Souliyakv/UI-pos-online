import 'package:flutter/foundation.dart';
import 'package:sell_product/models/addproducttocatalog.dart';

class AddProductToCatalogProvider with ChangeNotifier {
  List<AddProductToCatalog> addproducttocatalogs = [];
  List<AddProductToCatalog> getAddProductToCatalog() {
    return addproducttocatalogs;
  }

  void addAddProductToCatalog(AddProductToCatalog statement) {
    addproducttocatalogs.insert(0, statement);
    notifyListeners();
  }

  void removeProductToCatalogsAll(String removestatement) {
    addproducttocatalogs.remove(removestatement);
    notifyListeners();
  }

  void removeProductToCatalogs(int removestatement) {
    addproducttocatalogs.removeAt(removestatement);
    notifyListeners();
  }

  void clearList() {
    addproducttocatalogs.clear();
    notifyListeners();
  }
}

class AddDataShopperToBillingProvider with ChangeNotifier {
  List<AddDataShopperToBilling> adddatashoppertobillings = [];
  List<AddDataShopperToBilling> getAddDataShopperToBilling() {
    return adddatashoppertobillings;
  }

  void addAddDataShopperToBilling(AddDataShopperToBilling statement1) {
    adddatashoppertobillings.insert(0, statement1);
    notifyListeners();
  }

  void clearslistShopper() {
    adddatashoppertobillings.clear();
    notifyListeners();
  }
}

class TotalPriceProvider with ChangeNotifier {
  List<TotalPrice> totalprices = [];
  List<TotalPrice> getTotalPrice() {
    return totalprices;
  }

  void addTotalPrice(TotalPrice statement2) {
    totalprices.insert(0, statement2);
    notifyListeners();
  }

  void removeTotalPrice() {
    totalprices.removeAt(1);
    notifyListeners();
  }

  void clerlisttotalprice() {
    totalprices.clear();
    notifyListeners();
  }
}
