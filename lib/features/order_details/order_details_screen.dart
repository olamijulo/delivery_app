// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:delivery_app/features/order_details/order_details_viewmodel.dart';
import 'package:delivery_app/features/order_details/widgets/order_detail_tile.dart';
import 'package:delivery_app/features/order_details/widgets/order_tile.dart';
import 'package:delivery_app/features/login/login_view_model.dart';
import 'package:delivery_app/features/track_order/track_order_screen.dart';
import 'package:delivery_app/services/ably_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class OrderDetailsScreen extends ConsumerStatefulWidget {
  OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends ConsumerState<OrderDetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(ablyProvider).channel!.attach();
    ref.read(orderDetailsProvider.notifier).listenForMessages();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xffDEE2E6),
                    child: ClipOval(
                      child: Image.network(
                        ref.watch(loginProvider).profileImgUrl!,
                        errorBuilder: (context, error, stackTrace) =>
                            Icon(Icons.person),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    ref.watch(loginProvider).userName!,
                    style: TextStyle(fontSize: 18.0),
                  )
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TrackOrderScreen()));
                },
                child: Container(
                  width: double.infinity,
                  height: 260.0,
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                      color: Color(0xffDEE2E6),
                      borderRadius: BorderRadius.all(Radius.circular(30.0))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/images/package.png',
                          scale: 8,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Center(
                        child: Text(
                          'Your Order has been placed',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Track your order',
                            style: TextStyle(
                                fontSize: 16.0, color: Colors.black45),
                          ),
                          Icon(
                            Icons.chevron_right,
                            color: Colors.black45,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      SizedBox(
                        width: 200.0,
                        child: Text(
                          ref.watch(orderDetailsProvider).statusLabel!,
                          style: TextStyle(color: Colors.black, fontSize: 16.0),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      StepProgressIndicator(
                        totalSteps: 6,
                        currentStep: ref
                            .watch(orderDetailsProvider)
                            .deliveryStatusProgressCount!,
                        size: 5.0,
                        roundedEdges: Radius.circular(30),
                        selectedColor: Color(0xFFff4d4d),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                  height: 220.0,
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.05),
                      border: Border.all(
                        width: 1.0,
                        color: Colors.grey.withOpacity(0.3),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  child: Column(
                    children: [
                      OrderTile(),
                      SizedBox(
                        height: 20.0,
                      ),
                      OrderDetailTile(
                        title: 'Order ID',
                        label: '#3456378',
                      ),
                      Divider(
                        color: Colors.black12,
                      ),
                      OrderDetailTile(
                        title: 'Order Date',
                        label: 'Mon, Nov 14, 2023',
                      ),
                      Divider(
                        color: Colors.black12,
                      ),
                      OrderDetailTile(
                        title: 'Order Type',
                        label: 'Instant',
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
