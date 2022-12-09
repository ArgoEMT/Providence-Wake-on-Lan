import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wake_on_lan/wake_on_lan.dart';

import '../../../core/config/app_theme.dart';
import '../../../core/config/router.dart';
import '../../../core/model/connection.dart';
import '../../../generated/l10n.dart';
import '../bloc/home_screen_bloc.dart';
import 'ip_button.dart';

class ConnectionCard extends StatelessWidget {
  const ConnectionCard({
    super.key,
    required this.connection,
  });

  final Connection connection;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeScreenBloc>();
    return TextButton(
      onPressed: () {
        try {
          // send the magic packet
          IPv4Address ipv4Address = IPv4Address(connection.ipAddress);
          MACAddress macAddress = MACAddress(connection.macAddress);
          WakeOnLAN(ipv4Address, macAddress, port: connection.port).wake();

          // show an informative snackbar
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                S.of(context).magicPacketEnvoyConnectionname(connection.name),
              ),
              duration: const Duration(seconds: 1),
            ),
          );
        } catch (e) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Theme.of(context).colorScheme.error,
              content: Text(
                S.of(context).erreurLorsDeLenvoiDuMagicPacketE(e.toString()),
                style: const TextStyle(color: AppTheme.background),
              ),
            ),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            IpButton(ipAddress: connection.ipAddress),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    connection.name,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    connection.ipAddress,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 48,
              height: 48,
              child: TextButton(
                onPressed: () => context
                    .go(RoutePaths.newConnection, arguments: connection)
                    .then(
                      (value) => bloc.add(
                        HomeScreenLoadConnectionsEvent(),
                      ),
                    ),
                child: const Icon(Icons.edit),
              ),
            ),
            const SizedBox(width: 8),
            SizedBox(
              width: 48,
              height: 48,
              child: TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(S.of(context).supprimerLaConnexion),
                      content: Text(
                        S.of(context).voulezvousVraimentSupprimerCetteConnexion,
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(S.of(context).annuler),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            bloc.add(
                              HomeScreenRemoveConnectionEvent(
                                connection.id!,
                              ),
                            );
                          },
                          child: Text(
                            S.of(context).supprimer,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.error,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                child: Icon(
                  Icons.delete,
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
