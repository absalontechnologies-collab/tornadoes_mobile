import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import '../config/env.dart';

class PusherService {
  static final PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();

  static Future<void> initialize() async {
    try {
      await pusher.init(
        apiKey: Env.pusherAppKey,
        cluster: Env.pusherAppCluster,
        // onEvent: onEvent,
        // onSubscriptionSucceeded: onSubscriptionSucceeded,
        // onSubscriptionError: onSubscriptionError,
        // onDecryptionFailure: onDecryptionFailure,
        // onMemberAdded: onMemberAdded,
        // onMemberRemoved: onMemberRemoved,
      );
      await pusher.connect();
    } catch (e) {
      print("ERROR Pusher Initialization: $e");
    }
  }
  static Future<void> subscribeToNewDeliveries(Function(PusherEvent) onEvent) async {
    try {
      await pusher.subscribe(
        channelName: 'deliveries-channel',
        onEvent: onEvent,
      );
    } catch (e) {
      print("ERROR Pusher Subscription: $e");
    }
  }

  static Future<void> unsubscribeFromDeliveries() async {
    try {
      await pusher.unsubscribe(channelName: 'deliveries-channel');
    } catch (e) {
      print("ERROR Pusher Unsubscribe: $e");
    }
  }
}
