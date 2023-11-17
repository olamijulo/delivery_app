import 'package:flutter/material.dart';

class OrderStatusCard extends StatelessWidget {
  final String title;
  final String label;
  final String status;
  final String time;
  const OrderStatusCard({
    super.key,
    required this.title,
    required this.label,
    required this.status,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            color: Color(0xFFf2f2f2),
            border: Border.all(color: Color(0xffe6e6e6)),
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
                Spacer(),
              ],
            ),
            Text(
              label,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                  color: Colors.black45),
            ),
            SizedBox(
              height: 10.0,
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  time,
                  style: TextStyle(fontSize: 10.0),
                ))
          ],
        ));
  }
}