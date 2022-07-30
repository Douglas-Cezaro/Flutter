import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';

class OrderStatusWidget extends StatelessWidget {
  final String status;
  final bool isOverdue;

  final Map<String, int> allStatus = <String, int>{
    'pending_payment': 0,
    'refunded': 1,
    'paid': 2,
    'preparing_purchase': 3,
    'shipping': 4,
    'delivered': 5,
  };

  int get currentStatus => allStatus[status]!;

  OrderStatusWidget({
    Key? key,
    required this.status,
    required this.isOverdue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _StatusDot(isActive: true, title: 'Pedido confirmado'),
        const _CustomDivider(),
        if (currentStatus == 1) ...[
          const _StatusDot(
            isActive: true,
            title: 'Pix estornado',
            background: Colors.orange,
            icon: Icons.close,
          ),
        ] else if (isOverdue) ...[
          const _StatusDot(
            isActive: true,
            title: 'Pagamento PIX vencido',
            background: Colors.red,
            icon: Icons.close,
          )
        ] else ...[
          _StatusDot(isActive: currentStatus >= 2, title: 'Pagamento'),
          const _CustomDivider(),
          _StatusDot(isActive: currentStatus >= 3, title: 'Preparando'),
          const _CustomDivider(),
          _StatusDot(isActive: currentStatus >= 4, title: 'Envio'),
          const _CustomDivider(),
          _StatusDot(isActive: currentStatus == 5, title: 'Entregue'),
        ]
      ],
    );
  }
}

class _CustomDivider extends StatelessWidget {
  const _CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
      height: 10.0,
      width: 2.0,
      color: Colors.grey.shade300,
    );
  }
}

class _StatusDot extends StatelessWidget {
  final bool isActive;
  final String title;
  final Color? background;
  final IconData? icon;

  const _StatusDot({
    Key? key,
    required this.isActive,
    required this.title,
    this.background,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Dot
        Container(
          alignment: Alignment.center,
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: background ?? CustomColors.customSwatchColor,
            ),
            color: isActive
                ? background ?? CustomColors.customSwatchColor
                : Colors.transparent,
          ),
          child: isActive
              ? Icon(
                  icon ?? Icons.check,
                  size: 13.0,
                  color: Colors.white,
                )
              : const SizedBox.shrink(),
        ),
        // Divisor
        const SizedBox(
          width: 5.0,
        ),
        // Texto
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 12.0,
            ),
          ),
        ),
      ],
    );
  }
}
