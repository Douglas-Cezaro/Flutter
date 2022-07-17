import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/models/cart_model.dart';

class DiscountCard extends StatelessWidget {
  const DiscountCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: ExpansionTile(
        title: Text(
          "Cupom de desconto",
          textAlign: TextAlign.start,
          style:
              TextStyle(fontWeight: FontWeight.w500, color: Colors.grey[700]),
        ),
        leading: const Icon(Icons.card_giftcard),
        trailing: const Icon(Icons.add),
        children: [
          const Padding(padding: EdgeInsets.all(8.0)),
          TextFormField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: "Digite seu cupom"),
            initialValue: CartModel.of(context).couponCode ?? "",
            onFieldSubmitted: (text) {
              FirebaseFirestore.instance
                  .collection("coupons")
                  .doc(text)
                  .get()
                  .then((docSnap) {
                final data = docSnap.data() as Map<String, dynamic>;
                if (data != null) {
                  CartModel.of(context).setCoupon(text, data["percent"]);
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text("Desconto de ${data["percent"]}% aplicado!"),
                    backgroundColor: Theme.of(context).primaryColor,
                  ));
                } else {
                  CartModel.of(context).setCoupon(null, 0);
                  Scaffold.of(context).showSnackBar(const SnackBar(
                    content: Text("Cupom não existente"),
                    backgroundColor: Colors.redAccent,
                  ));
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
