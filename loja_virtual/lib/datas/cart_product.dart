import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loja_virtual/datas/product_data.dart';

class CartProduct {
  late String cid;
  late String category;
  late String pid;
  late int quantity;
  late String size;

  ProductData? productData;

  CartProduct();

  CartProduct.fromDocument(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    cid = snapshot.id;
    category = data['category'];
    pid = data['pid'];
    quantity = data['quantity'];
    size = data["size"];
  }

  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'pid': pid,
      'quantity': quantity,
      'size': size,
      'product': productData!.toResumeMap()
    };
  }
}
