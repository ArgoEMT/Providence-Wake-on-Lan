// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a fr_FR locale. All the
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
  String get localeName => 'fr_FR';

  static String m0(errorMessage) =>
      "Erreur lors de l\\\'envoi du magic packet : errorMessage";

  static String m1(connectionName) => "Magic packet envoyé à connectionName";

  static String m2(ipAddress) => "Tentative de ping sur ipAddress";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "adresseIp": MessageLookupByLibrary.simpleMessage("Adresse IP*"),
        "adresseIpInvalide":
            MessageLookupByLibrary.simpleMessage("Adresse IP invalide"),
        "adresseMac": MessageLookupByLibrary.simpleMessage("Adresse MAC*"),
        "adresseMacInvalide":
            MessageLookupByLibrary.simpleMessage("Adresse MAC invalide"),
        "annuler": MessageLookupByLibrary.simpleMessage("Annuler"),
        "ceChampEstRequis":
            MessageLookupByLibrary.simpleMessage("Ce champ est requis"),
        "create": MessageLookupByLibrary.simpleMessage("Créer"),
        "erreurLorsDeLenvoiDuMagicPacketE": m0,
        "magicPacketEnvoyConnectionname": m1,
        "mesConnexions": MessageLookupByLibrary.simpleMessage("Mes connexions"),
        "nom": MessageLookupByLibrary.simpleMessage("Nom*"),
        "nouvelleConnexion":
            MessageLookupByLibrary.simpleMessage("Nouvelle connexion"),
        "port": MessageLookupByLibrary.simpleMessage("Port"),
        "save": MessageLookupByLibrary.simpleMessage("Modifier"),
        "supprimer": MessageLookupByLibrary.simpleMessage("Supprimer"),
        "supprimerLaConnexion":
            MessageLookupByLibrary.simpleMessage("Supprimer la connexion"),
        "tentativeDePingSur": m2,
        "voulezvousVraimentSupprimerCetteConnexion":
            MessageLookupByLibrary.simpleMessage(
                "Voulez-vous vraiment supprimer cette connexion ?")
      };
}
