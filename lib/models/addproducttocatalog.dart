class AddProductToCatalog {
  String? nameProduct;
  double? priceProduct;
  double? amountProduct;
  double? totlePrice;

  AddProductToCatalog(
      this.nameProduct, this.priceProduct, this.amountProduct, this.totlePrice);
}

class AddDataShopperToBilling {
  String? nameShopper;
  String? phoneShopper;
  String? sentPlace;
  DateTime? dateTime;
  AddDataShopperToBilling(
      this.nameShopper, this.phoneShopper, this.sentPlace, this.dateTime);
}

class TotalPrice {
  double? totalPrice;
  TotalPrice(this.totalPrice);
}
