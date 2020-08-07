// To parse this JSON data, do
//
//final products = productsFromJson(jsonString);

import 'dart:convert';

List<Products> productsFromJson(String str) =>
    List<Products>.from(json.decode(str).map((x) => Products.fromJson(x)));

String productsToJson(List<Products> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Products {
  Products({
    this.id,
    this.productDetailsBarcodeValue,
    this.productDetailsProductName,
    this.productDetailsProductVariant,
    this.productDetailsProductPrice,
    this.productDetailsProductImage,
  });

  int id;
  String productDetailsBarcodeValue;
  String productDetailsProductName;
  String productDetailsProductVariant;
  int productDetailsProductPrice;
  String productDetailsProductImage;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        id: json["_id"],
        productDetailsBarcodeValue: json["productDetails/barcodeValue"],
        productDetailsProductName: json["productDetails/productName"],
        productDetailsProductVariant: json["productDetails/productVariant"],
        productDetailsProductPrice: json["productDetails/productPrice"],
        productDetailsProductImage: json["productDetails/productImage"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "productDetails/barcodeValue": productDetailsBarcodeValue,
        "productDetails/productName": productDetailsProductName,
        "productDetails/productVariant": productDetailsProductVariant,
        "productDetails/productPrice": productDetailsProductPrice,
        "productDetails/productImage": productDetailsProductImage,
      };
}
