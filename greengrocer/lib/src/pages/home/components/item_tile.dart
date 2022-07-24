import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/models/item_model.dart';

class ItemTile extends StatelessWidget {
  const ItemTile({Key? key, required this.item}) : super(key: key);

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: Colors.grey.shade300,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Imagem
            Expanded(
              child: Image.asset(item.imgUrl),
            ),
            // Nome Produto
            Text(
              item.itemName,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Preço - Unidade - Produto
            Row(
              children: [
                Text(
                  item.price.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: CustomColors.customSwatchColor,
                  ),
                ),
                Text(
                  "/${item.unit}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
