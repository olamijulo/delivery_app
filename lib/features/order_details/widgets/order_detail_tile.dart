import 'package:flutter/material.dart';

class OrderDetailTile extends StatelessWidget {
  final String? title;
  final String? label;
  const OrderDetailTile({
    super.key,
    required this.title,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title!,
          style: TextStyle(fontSize: 14.0),
        ),
        Text(
          label!,
          style: TextStyle(fontSize: 14.0),
        ),
      ],
    );
  }
}
