import 'package:cloud_firestore/cloud_firestore.dart';

class ProductData {
  String category = "";
  late String id;

  late String title;
  late String description;

  late double price;

  late List images;
  late List sizes;

  ProductData.fromDocument(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    id = snapshot.id;
    title = data['title'];
    description = data['description'];
    price = data['price'] + 0.0;
    images = data['images'];
    sizes = data["sizes"];
  }

  Map<String, dynamic> toResumeMap() {
    return {
      'title': title,
      'description': description,
      'price': price,
    };
  }
}
