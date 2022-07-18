import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrderTile extends StatelessWidget {
  final String orderId;

  const OrderTile({Key? key, required this.orderId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection("orders")
              .doc(orderId)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              int status = snapshot.data!["status"];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Código do pedido: ${snapshot.data!.id}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    _buildProductsText(snapshot.data!),
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    "Status do pedido:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildCircle("1", "Preparação", status, 1),
                      Container(
                        height: 1.0,
                        width: 40.0,
                        color: Colors.grey[500],
                      ),
                      _buildCircle("2", "Transporte", status, 2),
                      Container(
                        height: 1.0,
                        width: 40.0,
                        color: Colors.grey[500],
                      ),
                      _buildCircle("3", "Entrega", status, 3),
                    ],
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }

  String _buildProductsText(DocumentSnapshot snapshot) {
    String text = "Descrição:\n";
    var data = snapshot.data() as Map<String, dynamic>;
    double totalPrice = data["totalPrice"] as double;

    for (LinkedHashMap p in data["products"]) {
      double price = p["product"]["price"] as double;
      text +=
          "${p["quantity"]} X ${p["product"]["title"]} (R\$ ${price.toStringAsFixed(2)})\n";
    }
    text += "Total: R\$ ${totalPrice.toStringAsFixed(2)}";
    return text;
  }

  Widget _buildCircle(
      String title, String subTitle, int status, int thisStatus) {
    Color? backColor;
    Widget child;

    if (status < thisStatus) {
      backColor = Colors.grey[500];
      child = Text(title, style: const TextStyle(color: Colors.white));
    } else if (status == thisStatus) {
      backColor = Colors.blue;
      child = Stack(
        alignment: Alignment.center,
        children: [
          Text(title, style: const TextStyle(color: Colors.white)),
          const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          )
        ],
      );
    } else {
      backColor = Colors.green;
      child = const Icon(
        Icons.check,
        color: Colors.white,
      );
    }

    return Column(
      children: [
        CircleAvatar(
          radius: 20.0,
          backgroundColor: backColor,
          child: child,
        ),
        Text(subTitle),
      ],
    );
  }
}
