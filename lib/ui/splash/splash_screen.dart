import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/config/router.dart';
import 'bloc/splash_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = SplashBloc();
    return BlocProvider(
      create: (context) => bloc,
      child: BlocBuilder<SplashBloc, SplashState>(
        builder: (context, state) {
          WidgetsBinding.instance.addPostFrameCallback(
            (_) {
              if (state is SplashInitialState) {
                bloc.add(SplashLoadingEvent());
              } else if (state is SplashLoadedState) {
                context.go(RoutePaths.home);
              }
            },
          );
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
