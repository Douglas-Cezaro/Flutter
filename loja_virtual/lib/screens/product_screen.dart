import 'package:flutter/material.dart';
import 'package:loja_virtual/datas/product_data.dart';
import 'package:carousel_pro/carousel_pro.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key, required this.product}) : super(key: key);

  final ProductData product;

  @override
  State<ProductScreen> createState() => _ProductScreenState(product);
}

class _ProductScreenState extends State<ProductScreen> {
  final ProductData product;

  _ProductScreenState(this.product);

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          AspectRatio(
            aspectRatio: 1.0,
            child: Carousel(
              images: product.images.map((url) => NetworkImage(url)).toList(),
              dotSize: 4.0,
              dotSpacing: 15.0,
              dotBgColor: Colors.transparent,
              dotColor: primaryColor,
              dotIncreasedColor: primaryColor,
              autoplay: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  product.title,
                  style: const TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.w500),
                  maxLines: 3,
                ),
                Text(
                  "R\$ ${product.price.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
