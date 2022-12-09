import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/config/router.dart';
import '../../generated/l10n.dart';
import '../components/credit_footer.dart';
import '../components/custom_appbar.dart';
import 'bloc/home_screen_bloc.dart';
import 'components/connection_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = HomeScreenBloc();
    return Scaffold(
      bottomNavigationBar: const CreditFooter(),
      body: SafeArea(
        child: Column(
          children: [
            CustomAppbar(title: S.of(context).mesConnexions, canGoBack: false),
            Expanded(
              child: BlocProvider(
                create: (context) => bloc,
                child: BlocBuilder<HomeScreenBloc, HomeScreenState>(
                  builder: (context, state) {
                    if (state is HomeScreenInitial) {
                      bloc.add(HomeScreenLoadConnectionsEvent());
                    }
                    if (state is HomeScreenLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state is HomeScreenLoadedState) {
                      if (bloc.connections.isEmpty) {
                        return Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: OutlinedButton(
                              onPressed: () =>
                                  context.go(RoutePaths.newConnection).then(
                                        (value) => bloc.add(
                                          HomeScreenLoadConnectionsEvent(),
                                        ),
                                      ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(S.of(context).nouvelleConnexion),
                              ),
                            ),
                          ),
                        );
                      }
                      return ListView.builder(
                        itemCount: bloc.connections.length + 1,
                        itemBuilder: (context, index) {
                          if (index == bloc.connections.length) {
                            return Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Align(
                                alignment: Alignment.center,
                                child: OutlinedButton(
                                  onPressed: () =>
                                      context.go(RoutePaths.newConnection).then(
                                            (value) => bloc.add(
                                              HomeScreenLoadConnectionsEvent(),
                                            ),
                                          ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child:
                                        Text(S.of(context).nouvelleConnexion),
                                  ),
                                ),
                              ),
                            );
                          }
                          final connection = bloc.connections[index];
                          return ConnectionCard(connection: connection);
                        },
                      );
                    }
                    return Container();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
