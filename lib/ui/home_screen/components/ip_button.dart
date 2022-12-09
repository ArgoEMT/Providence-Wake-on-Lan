import 'package:breathing_collection/breathing_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/config/app_theme.dart';
import '../../../generated/l10n.dart';
import 'ip_bloc/ip_bloc.dart';

class IpButton extends StatelessWidget {
  const IpButton({
    super.key,
    required this.ipAddress,
  });

  final String ipAddress;

  @override
  Widget build(BuildContext context) {
    final bloc = IpBloc();
    return BlocProvider(
      create: (context) => bloc,
      child: BlocBuilder<IpBloc, IpState>(
        builder: (context, state) {
          if (state is IpInitialState) {
            bloc.add(IpPingEvent(ipAddress));
          }
          if (state is IpLoadingState) {
            return SizedBox(
              height: 24,
              width: 48,
              child: BreathingGlowingButton(
                height: 24.0,
                width: 24.0,
                buttonBackgroundColor: AppTheme.selection,
                glowColor: AppTheme.purple,
                icon: null,
                iconColor: AppTheme.selection,
                onTap: null,
              ),
            );
          }
          if (state is IpLoadedState) {
            return SizedBox(
              height: 48,
              width: 48,
              child: TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: const Duration(seconds: 1),
                      content: Text(S.of(context).tentativeDePingSur(ipAddress)),
                    ),
                  );
                  bloc.add(IpPingEvent(ipAddress));
                },
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: state.success
                        ? AppTheme.green
                        : Theme.of(context).colorScheme.error,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
