import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/service/connection_service.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitialState()) {
    on<SplashEvent>((event, emit) async {
      if (event is SplashLoadingEvent) {
        await SharedPreferences.getInstance().then(
          (prefs) {
            final connectionService = ConnectionService(preferences: prefs);
            if (!GetIt.I.isRegistered(instance: connectionService)) {
              GetIt.instance
                  .registerSingleton(ConnectionService(preferences: prefs));
              if (kDebugMode) {
                print('ConnectionService registered in GetIt');
              }
            }
          },
        );
        emit(SplashLoadedState());
      }
    });
  }
}
