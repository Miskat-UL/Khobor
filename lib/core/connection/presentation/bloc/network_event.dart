abstract class NetworkEvent {}

class NetworkObserver extends NetworkEvent {}

class NetworkNotify extends NetworkEvent {
  final bool isConnected;
  NetworkNotify({this.isConnected = false});
}
