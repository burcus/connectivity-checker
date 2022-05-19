import 'package:connectivity_checker/bloc/network_event.dart';
import 'package:connectivity_checker/bloc/network_state.dart';
import 'package:connectivity_checker/helper/network_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  NetworkBloc._() : super(NetworkInitial()) {
    on<NetworkObserve>(_observe);
    on<NetworkNotify>(_notifyStatus);
  }

  static final NetworkBloc _instance = NetworkBloc._();

  factory NetworkBloc() => _instance;

  void _observe(event, emit) {
    NetworkHelper.observeNetwork();
  }

  void _notifyStatus(NetworkNotify event, emit) {
    event.isConnected ? emit(NetworkSuccess()) : emit(NetworkFailure());
  }
}
