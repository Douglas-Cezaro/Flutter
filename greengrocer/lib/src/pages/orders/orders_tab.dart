import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/';

class OrdersTab extends StatelessWidget {
  const OrdersTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedidos'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16.0),
        physics: const BouncingScrollPhysics(),
        itemBuilder: itemBuilder,
        separatorBuilder: (_, index) => const SizedBox(
          height: 10,
        ),
        itemCount: ,
      ),
    );
  }
}
