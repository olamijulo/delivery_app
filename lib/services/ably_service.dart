import 'dart:async';

import 'package:ably_flutter/ably_flutter.dart' as ably;
import 'package:ably_flutter/ably_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ablyProvider = Provider.autoDispose<AblyService>((ref) {
  return AblyService();
});

class AblyService {
  static AblyService? _instance;

  AblyService._internal() {
    debugPrint('AblyService called');
    _instance = this;
  }

  factory AblyService() => _instance ?? AblyService._internal();

  // Create an instance of ClientOptions with Ably key
  final clientOptions = ably.ClientOptions(key: dotenv.env['ABLY_API_KEY']);

  ably.Realtime? realtime;
  ably.Rest? rest;
  ably.RealtimeChannel? channel;
  StreamSubscription<ably.Message>? subscription;

  void initialize() {
// Use ClientOptions to create Realtime or REST instance
    try {
      realtime = ably.Realtime(options: clientOptions);
      rest = ably.Rest(options: clientOptions);
    } on Exception catch (e) {
      // TODO
    }
  }

  void listenForConnectionState(channelName) {
    realtime!.connection
        .on()
        .listen((ably.ConnectionStateChange stateChange) async {
      // Handle connection state change events
      print('stateChange ${stateChange.current}');
      switch (stateChange.current) {
        case ably.ConnectionState.connected:
          createRealtimeChannel(channelName);
          break;
        default:
      }
    });
  }

  void createRealtimeChannel(name) {
    channel = realtime!.channels.get(name);
    listenForChannelEvent();
  }

  void listenForChannelEvent() {
    channel!.on().listen((ably.ChannelStateChange stateChange) async {
      // Handle channel state change events
      print('ChannelStateChange ${stateChange.current}');
    });
  }

  void listenForMessages(callback(Message message)) {
    subscription = channel!.subscribe().listen((ably.Message message) {
      // Handle channel message
      print('message ${message.name}');
      callback(message);
    });
  }
}
