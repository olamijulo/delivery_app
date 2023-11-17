import 'package:flutter/material.dart';

class OrderTile extends StatelessWidget {
  const OrderTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      width: double.infinity,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: Colors.black12.withOpacity(0.08),
          borderRadius: BorderRadius.all(Radius.circular(
            20.0,
          ))),
      child: Row(
        children: [
          Container(
            height: 70.0,
            width: 70.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            child: FittedBox(
                child: Image.asset(
              'assets/images/ham-burger.png',
            )),
          ),
          SizedBox(
            width: 5.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Ham-burger',
                style: TextStyle(fontSize: 15.0),
              ),
              Text(
                'Add-On: French fries x 2',
                style: TextStyle(fontSize: 12.0),
              ),
            ],
          ),
          Spacer(),
          Text(
            '₦9000',
            style: TextStyle(fontSize: 14.0),
          )
        ],
      ),
    );
  }
}
