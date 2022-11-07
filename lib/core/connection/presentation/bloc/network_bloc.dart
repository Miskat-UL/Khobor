import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khobor/core/connection/presentation/bloc/network_event.dart';
import 'package:khobor/core/connection/presentation/bloc/network_state.dart';
import 'package:khobor/core/connection/service/connection_service.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  NetworkBloc._() : super(NetworkInitial()) {
    on<NetworkObserver>(_observe);
    on<NetworkNotify>(_notifyStatus);
  }
  static final NetworkBloc _instance = NetworkBloc._();

  factory NetworkBloc() => _instance;

  _observe(event, emit) {
    NetworkHelper.observerNetwork();
  }

  _notifyStatus(NetworkNotify event, emit) {
    print('hoibooo nanaaannan');
    event.isConnected ? emit(NetworkSuccess()) : emit(NetworkFailure());
  }
}
