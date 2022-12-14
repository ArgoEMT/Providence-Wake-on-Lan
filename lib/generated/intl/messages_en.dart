// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(errorMessage) =>
      "Error when sending magic packet : errorMessag";

  static String m1(connectionName) => "Magic packet sent to connectionName";

  static String m2(ipAddress) => "Ping attempt on ipAddress";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "adresseIp": MessageLookupByLibrary.simpleMessage("IP address*"),
        "adresseIpInvalide":
            MessageLookupByLibrary.simpleMessage("Invalid IP address"),
        "adresseMac": MessageLookupByLibrary.simpleMessage("MAC address*"),
        "adresseMacInvalide":
            MessageLookupByLibrary.simpleMessage("Invalid MAC address"),
        "annuler": MessageLookupByLibrary.simpleMessage("Cancel"),
        "ceChampEstRequis":
            MessageLookupByLibrary.simpleMessage("This field is required"),
        "create": MessageLookupByLibrary.simpleMessage("Create"),
        "erreurLorsDeLenvoiDuMagicPacketE": m0,
        "magicPacketEnvoyConnectionname": m1,
        "mesConnexions": MessageLookupByLibrary.simpleMessage("My connections"),
        "nom": MessageLookupByLibrary.simpleMessage("Name*"),
        "nouvelleConnexion":
            MessageLookupByLibrary.simpleMessage("New connection"),
        "port": MessageLookupByLibrary.simpleMessage("Port"),
        "save": MessageLookupByLibrary.simpleMessage("Save"),
        "supprimer": MessageLookupByLibrary.simpleMessage("Delete"),
        "supprimerLaConnexion":
            MessageLookupByLibrary.simpleMessage("Delete the connection"),
        "tentativeDePingSur": m2,
        "voulezvousVraimentSupprimerCetteConnexion":
            MessageLookupByLibrary.simpleMessage(
                "Do you really want to delete this connection ?")
      };
}
