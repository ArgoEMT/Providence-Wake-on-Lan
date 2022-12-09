import 'package:dart_ping/dart_ping.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'ip_event.dart';
part 'ip_state.dart';

class IpBloc extends Bloc<IpEvent, IpState> {
  IpBloc() : super(IpInitialState()) {
    on<IpEvent>(
      (event, emit) async {
        if (event is IpPingEvent) {
          emit(IpLoadingState());
          final ping = Ping(event.ipAddress, count: 1);
          final firstEvent = await ping.stream.first;
          if (kDebugMode) {
            print(
                'Ping ip ${event.ipAddress} : ${firstEvent.summary?.transmitted == firstEvent.summary?.received ? 'success' : 'fail'}');
          }
          final success =
              firstEvent.summary?.transmitted == firstEvent.summary?.received;

          if (success) {
            emit(IpLoadedState(true));
          } else {
            emit(IpLoadedState(false));
          }
        }
      },
    );
  }
}
