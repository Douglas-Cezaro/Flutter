import 'package:flutter/material.dart';
import 'package:greengrocer/src/models/cart_item_model.dart';
import 'package:greengrocer/src/models/order_model.dart';
import 'package:greengrocer/src/pages/orders/components/order_status_widget.dart';
import 'package:greengrocer/src/services/utils_services.dart';

class OrderTile extends StatelessWidget {
  final OrderModel order;

  OrderTile({
    Key? key,
    required this.order,
  }) : super(key: key);

  final UtilsServices _utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Theme(
        // Tirando bordas que ficam aparecendo no ExpansionTile
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          childrenPadding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Pedido: ${order.id}"),
              Text(
                _utilsServices.formatDateTime(order.createdDateTime),
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          children: [
            SizedBox(
              height: 150,
              child: Row(
                children: [
                  // Lista de produtos
                  Expanded(
                    flex: 3,
                    child: ListView(
                      children: order.items.map((orderItem) {
                        return _OrderItemWidget(
                          orderItem: orderItem,
                          utilsServices: _utilsServices,
                        );
                      }).toList(),
                    ),
                  ),
                  // Divisão
                  VerticalDivider(
                    color: Colors.grey.shade300,
                    thickness: 2.0,
                    width: 10.0,
                  ),
                  // Status do Pedido
                  Expanded(
                    flex: 2,
                    child: OrderStatusWidget(
                      status: order.status,
                      isOverdue: order.overdueDateTime.isBefore(DateTime.now()),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OrderItemWidget extends StatelessWidget {
  const _OrderItemWidget({
    Key? key,
    required this.utilsServices,
    required this.orderItem,
  }) : super(key: key);

  final UtilsServices utilsServices;
  final CartItemModel orderItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          Text(
            '${orderItem.quantity} ${orderItem.item.unit} ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Text(orderItem.item.itemName),
          ),
          Text(
            utilsServices.priceToCurrency(
              orderItem.totalPrice(),
            ),
          )
        ],
      ),
    );
  }
}
