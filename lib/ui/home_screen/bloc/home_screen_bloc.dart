import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../core/model/connection.dart';
import '../../../core/service/connection_service.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(HomeScreenInitial()) {
    connectionService = GetIt.I<ConnectionService>();

    on<HomeScreenEvent>((event, emit) async {
      if (event is HomeScreenLoadConnectionsEvent) {
        connections.clear();
        final tempConnections = await connectionService.getAllConnection();
        connections.addAll(tempConnections);
        emit(HomeScreenLoadedState());
      }
      if (event is HomeScreenRemoveConnectionEvent) {
        await connectionService.removeConnection(event.connectionId);
        connections.removeWhere((element) => element.id == event.connectionId);
        emit(HomeScreenLoadedState());
      }
    });
  }

  late final ConnectionService connectionService;
  final List<Connection> connections = [];
}
