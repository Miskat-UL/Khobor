import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:khobor/core/connection/presentation/bloc/network_bloc.dart';
import 'package:khobor/core/connection/presentation/bloc/network_event.dart';

class NetworkHelper {
  static void observerNetwork() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        NetworkBloc().add(NetworkNotify());
      } else {
        NetworkBloc().add(NetworkNotify(isConnected: true));
      }
    });
  }
}
