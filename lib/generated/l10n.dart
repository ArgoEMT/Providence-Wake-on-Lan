// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Create`
  String get create {
    return Intl.message(
      'Create',
      name: 'create',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Invalid MAC address`
  String get adresseMacInvalide {
    return Intl.message(
      'Invalid MAC address',
      name: 'adresseMacInvalide',
      desc: '',
      args: [],
    );
  }

  /// `MAC address*`
  String get adresseMac {
    return Intl.message(
      'MAC address*',
      name: 'adresseMac',
      desc: '',
      args: [],
    );
  }

  /// `Invalid IP address`
  String get adresseIpInvalide {
    return Intl.message(
      'Invalid IP address',
      name: 'adresseIpInvalide',
      desc: '',
      args: [],
    );
  }

  /// `IP address*`
  String get adresseIp {
    return Intl.message(
      'IP address*',
      name: 'adresseIp',
      desc: '',
      args: [],
    );
  }

  /// `Name*`
  String get nom {
    return Intl.message(
      'Name*',
      name: 'nom',
      desc: '',
      args: [],
    );
  }

  /// `New connection`
  String get nouvelleConnexion {
    return Intl.message(
      'New connection',
      name: 'nouvelleConnexion',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get ceChampEstRequis {
    return Intl.message(
      'This field is required',
      name: 'ceChampEstRequis',
      desc: '',
      args: [],
    );
  }

  /// `My connections`
  String get mesConnexions {
    return Intl.message(
      'My connections',
      name: 'mesConnexions',
      desc: '',
      args: [],
    );
  }

  /// `Ping attempt on ipAddress`
  String tentativeDePingSur(String ipAddress) {
    return Intl.message(
      'Ping attempt on ipAddress',
      name: 'tentativeDePingSur',
      desc: 'Ping attempt on \$ipAddress',
      args: [ipAddress],
    );
  }

  /// `Do you really want to delete this connection ?`
  String get voulezvousVraimentSupprimerCetteConnexion {
    return Intl.message(
      'Do you really want to delete this connection ?',
      name: 'voulezvousVraimentSupprimerCetteConnexion',
      desc: '',
      args: [],
    );
  }

  /// `Delete the connection`
  String get supprimerLaConnexion {
    return Intl.message(
      'Delete the connection',
      name: 'supprimerLaConnexion',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get annuler {
    return Intl.message(
      'Cancel',
      name: 'annuler',
      desc: '',
      args: [],
    );
  }

  /// `Error when sending magic packet : errorMessag`
  String erreurLorsDeLenvoiDuMagicPacketE(String errorMessage) {
    return Intl.message(
      'Error when sending magic packet : errorMessag',
      name: 'erreurLorsDeLenvoiDuMagicPacketE',
      desc: 'Error message when magic packet failed',
      args: [errorMessage],
    );
  }

  /// `Magic packet sent to connectionName`
  String magicPacketEnvoyConnectionname(String connectionName) {
    return Intl.message(
      'Magic packet sent to connectionName',
      name: 'magicPacketEnvoyConnectionname',
      desc: 'Message when magic packet succeed',
      args: [connectionName],
    );
  }

  /// `Delete`
  String get supprimer {
    return Intl.message(
      'Delete',
      name: 'supprimer',
      desc: '',
      args: [],
    );
  }

  /// `Port`
  String get port {
    return Intl.message(
      'Port',
      name: 'port',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'fr', countryCode: 'FR'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
