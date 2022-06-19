import 'package:flutter/material.dart';
import 'package:loja_virtual/datas/product_data.dart';
import 'package:loja_virtual/screens/product_screen.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({Key? key, required this.type, required this.product})
      : super(key: key);

  final String type;
  final ProductData product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductScreen(
              product: product,
            ),
          ),
        );
      },
      child: Card(child: generateCard(context, type)),
    );
  }

  Widget generateCard(BuildContext context, String type) {
    if (type == "grid") {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 0.8,
            child: Image.network(
              product.images[0],
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    product.title,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "R\$ ${product.price.toStringAsFixed(2)}",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      );
    }
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: Image.network(
            product.images[0],
            fit: BoxFit.cover,
            height: 250.0,
            width: 200.0,
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(
                  "R\$ ${product.price.toStringAsFixed(2)}",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
