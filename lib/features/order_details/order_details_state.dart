// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:delivery_app/services/ably_service.dart';

class OrderDetailsState {
  int? deliveryStatusProgressCount;
  bool? orderPlaced;
  bool? orderAccepted;
  bool? orderPickupInProgress;
  bool? orderArrived;
  bool? orderDelivered;
  bool? orderOnTheWayToCustomer;
  String? statusLabel;
  AblyService? ablyService;
  OrderDetailsState(
      {this.deliveryStatusProgressCount,
      this.orderPlaced,
      this.orderAccepted,
      this.orderPickupInProgress,
      this.orderArrived,
      this.orderDelivered,
      this.ablyService,
      this.statusLabel,
      this.orderOnTheWayToCustomer});

  OrderDetailsState copyWith({
    int? deliveryStatusProgressCount,
    bool? orderPlaced,
    bool? orderAccepted,
    bool? orderPickupInProgress,
    bool? orderArrived,
    bool? orderDelivered,
    bool? orderOnTheWayToCustomer,
    String? statusLabel,
    AblyService? ablyService,
  }) {
    return OrderDetailsState(
        deliveryStatusProgressCount:
            deliveryStatusProgressCount ?? this.deliveryStatusProgressCount,
        orderPlaced: orderPlaced ?? this.orderPlaced,
        orderAccepted: orderAccepted ?? this.orderAccepted,
        orderPickupInProgress:
            orderPickupInProgress ?? this.orderPickupInProgress,
        orderArrived: orderArrived ?? this.orderArrived,
        orderDelivered: orderDelivered ?? this.orderDelivered,
        ablyService: ablyService ?? this.ablyService,
        orderOnTheWayToCustomer:
            orderOnTheWayToCustomer ?? this.orderOnTheWayToCustomer,
        statusLabel: statusLabel ?? this.statusLabel);
  }
}
