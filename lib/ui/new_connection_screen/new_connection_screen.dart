import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:wake_on_lan/wake_on_lan.dart';

import '../../core/config/router.dart';
import '../../core/model/connection.dart';
import '../../core/service/connection_service.dart';
import '../../generated/l10n.dart';
import '../components/custom_appbar.dart';

class NewConnectionScreen extends StatelessWidget {
  const NewConnectionScreen({
    Key? key,
    this.initialConnection,
  }) : super(key: key);

  final Connection? initialConnection;

  Widget _createField(
    BuildContext context, {
    required String title,
    required TextEditingController controller,
    required bool isRequired,
    String? Function(String?)? validator,
    String? hint,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(title),
          ),
          const SizedBox(height: 8.0),
          TextFormField(
            decoration: InputDecoration(hintText: hint),
            controller: controller,
            validator: validator ??
                (value) {
                  if (isRequired && (value == null || value.isEmpty)) {
                    return S.of(context).ceChampEstRequis;
                  }
                  return null;
                },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final nomController = TextEditingController(
      text: initialConnection?.name,
    );
    final adresseIpController = TextEditingController(
      text: initialConnection?.ipAddress,
    );
    final portController = TextEditingController(
      text: initialConnection?.port.toString(),
    );
    final macController = TextEditingController(
      text: initialConnection?.macAddress,
    );
    final formKey = GlobalKey<FormState>();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              CustomAppbar(
                title: initialConnection == null
                    ? S.of(context).nouvelleConnexion
                    : initialConnection!.name,
                canGoBack: true,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Form(
                        key: formKey,
                        child: Container(
                          constraints: const BoxConstraints(maxWidth: 300),
                          child: Column(
                            children: [
                              _createField(
                                context,
                                title: S.of(context).nom,
                                controller: nomController,
                                isRequired: true,
                              ),
                              _createField(
                                context,
                                title: S.of(context).adresseIp,
                                controller: adresseIpController,
                                isRequired: true,
                                validator: (value) {
                                  if (!IPv4Address.validate(value)) {
                                    return S.of(context).adresseIpInvalide;
                                  }
                                  return null;
                                },
                              ),
                              _createField(
                                context,
                                title: S.of(context).adresseMac,
                                controller: macController,
                                isRequired: true,
                                validator: (value) {
                                  if (!MACAddress.validate(value)) {
                                    return S.of(context).adresseMacInvalide;
                                  }
                                  return null;
                                },
                              ),
                              _createField(
                                context,
                                title: S.of(context).port,
                                controller: portController,
                                isRequired: false,
                                hint: '9',
                              ),
                              const SizedBox(height: 24),
                              Align(
                                alignment: Alignment.centerRight,
                                child: OutlinedButton(
                                  onPressed: () {
                                    if (formKey.currentState?.validate() ==
                                        false) {
                                      return;
                                    }
                                    final newConnection = Connection(
                                      name: nomController.text,
                                      ipAddress: adresseIpController.text,
                                      macAddress: macController.text,
                                      port: int.tryParse(portController.text) ??
                                          9,
                                    );
                                    if (initialConnection != null) {
                                      var newConnection =
                                          initialConnection!.copyWith(
                                        name: nomController.text,
                                        ipAddress: adresseIpController.text,
                                        macAddress: macController.text,
                                        port: int.tryParse(portController.text),
                                      );
                                      GetIt.I<ConnectionService>()
                                          .updateConnection(newConnection);
                                    } else {
                                      GetIt.I<ConnectionService>()
                                          .addConnection(newConnection);
                                    }
                                    context.pop();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      initialConnection == null
                                          ? S.of(context).create
                                          : S.of(context).save,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
