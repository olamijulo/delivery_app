// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:delivery_app/features/order_details/order_details_viewmodel.dart';
import 'package:delivery_app/features/track_order/widgets/custom_timline.dart';
import 'package:delivery_app/features/track_order/widgets/order_status_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TrackOrderScreen extends ConsumerWidget {
  const TrackOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Order Details',
          style: TextStyle(fontSize: 18.0, color: Colors.black),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      Container(
                        height: 70.0,
                        width: 70.0,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0))),
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
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Divider(
                  thickness: 5.0,
                  color: Colors.black12,
                ),
                CustomTimelinetile(
                  isFirst: false,
                  isLast: false,
                  isPast: ref.watch(orderDetailsProvider).orderPlaced!,
                  child: OrderStatusCard(
                    title: 'Order placed',
                    label: 'Waiting for vendor to accept your order',
                    status: 'Pending',
                    time: '9:15AM',
                  ),
                ),
                CustomTimelinetile(
                  isFirst: false,
                  isLast: false,
                  isPast: ref.watch(orderDetailsProvider).orderAccepted!,
                  child: OrderStatusCard(
                    title: 'Order accepted',
                    label: 'Your order has been accepted by the vendor',
                    status: 'Cooking',
                    time: '9:15AM',
                  ),
                ),
                CustomTimelinetile(
                  isFirst: false,
                  isLast: false,
                  isPast: ref.watch(orderDetailsProvider).orderPickupInProgress!,
                  child: OrderStatusCard(
                    title: 'Order pick up in progress',
                    label: 'A Rider on his way to pick up your order',
                    status: 'Cooking',
                    time: '9:15AM',
                  ),
                ),
                CustomTimelinetile(
                  isFirst: false,
                  isLast: false,
                  isPast: ref.watch(orderDetailsProvider).orderOnTheWayToCustomer!,
                  child: OrderStatusCard(
                    title: 'Order on the way',
                    label: 'A Rider has picked up your order and is on his way',
                    status: 'In Progress',
                    time: '9:15AM',
                  ),
                ),
                CustomTimelinetile(
                  isFirst: false,
                  isLast: false,
                  isPast: ref.watch(orderDetailsProvider).orderArrived!,
                  child: OrderStatusCard(
                    title: 'Order arrived',
                    label: 'Rider is arround to deliver your order',
                    status: 'In Progress',
                    time: '9:15AM',
                  ),
                ),
                CustomTimelinetile(
                  isFirst: false,
                  isLast: true,
                  isPast: ref.watch(orderDetailsProvider).orderDelivered!,
                  child: OrderStatusCard(
                    title: 'Order delivered',
                    label: 'Rider on his way to pick up your order',
                    status: 'In Progress',
                    time: '9:15AM',
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                SizedBox(
                  height: 50.0,
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          backgroundColor: Color(0xFFff4d4d)),
                      child: Text(
                        'Rate Order',
                        style: TextStyle(color: Colors.white),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
