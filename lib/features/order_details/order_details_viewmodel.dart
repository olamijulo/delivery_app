import 'package:delivery_app/features/order_details/order_details_state.dart';
import 'package:delivery_app/services/ably_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final orderDetailsProvider =
    StateNotifierProvider.autoDispose<OrderDetailsViewNodel, OrderDetailsState>(
        (ref) {
  return OrderDetailsViewNodel(OrderDetailsState(
      ablyService: ref.watch(ablyProvider),
      deliveryStatusProgressCount: 0,
      orderAccepted: false,
      orderArrived: false,
      orderDelivered: false,
      orderOnTheWayToCustomer: false,
      orderPickupInProgress: false,
      orderPlaced: false,
      statusLabel: 'Your order is pending.'));
});

class OrderDetailsViewNodel extends StateNotifier<OrderDetailsState> {
  OrderDetailsViewNodel(OrderDetailsState state) : super(state);
  int counter = 0;

  listenForMessages() {
    state.ablyService!.listenForMessages((message) {
      print('new message ${message.data}');

      changeDeliveryStatus(message.name);
    });
  }

  changeDeliveryStatus(status) {
    switch (status) {
      case 'ORDER PLACED':
        state = state.copyWith(
            deliveryStatusProgressCount: 1,
            orderPlaced: true,
            statusLabel: 'Waiting for vendor to accept your order.');
        break;
      case 'ORDER ACCEPTED':
        state = state.copyWith(
            deliveryStatusProgressCount: 2,
            orderAccepted: true,
            statusLabel: 'The vendor has accepted your order.');
        break;
      case 'ORDER PICK UP IN PROGRESS':
        state = state.copyWith(
            deliveryStatusProgressCount: 3,
            orderPickupInProgress: true,
            statusLabel: 'A rider will pick up your order shortly.');
        break;
      case 'ORDER ON THE WAY TO CUSTOMER':
        state = state.copyWith(
            deliveryStatusProgressCount: 4,
            orderOnTheWayToCustomer: true,
            statusLabel: 'Rider on the way to deliver your order.');
        break;
      case 'ORDER ARRIVED':
        state = state.copyWith(
            deliveryStatusProgressCount: 5,
            orderArrived: true,
            statusLabel: 'Your order has arrived.');
        break;
      case 'ORDER DELIVERED':
        state = state.copyWith(
            deliveryStatusProgressCount: 6,
            orderDelivered: true,
            statusLabel: 'Your order has been delivered.');
        break;
    }
  }
}
