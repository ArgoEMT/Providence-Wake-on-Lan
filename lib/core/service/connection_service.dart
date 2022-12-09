import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/connection.dart';

class ConnectionService {
  ConnectionService({
    required SharedPreferences preferences,
  }) : _preferences = preferences;

  static const _connectionKey = 'connection';

  final SharedPreferences _preferences;

  /// Add a new [Connection] to the shared preferences
  Future addConnection(Connection connection) async {
    final connectionList = _preferences.getStringList(_connectionKey) ?? [];
    final id = connectionList.length + 1;
    connection = connection.copyWith(id: id);
    connectionList.add(connection.toJson());
    await _preferences.setStringList(_connectionKey, connectionList);
    if (kDebugMode) {
      print('Connection added: ${connection.toJson()}');
    }
  }

  /// Gett the list of all the [Connection] stored in the shared preferences
  Future<List<Connection>> getAllConnection() async {
    final jsonList = _preferences.getStringList(_connectionKey) ?? [];

    if (kDebugMode) {
      print('Number of connections: ${jsonList.length}');
    }

    final connectionList = jsonList.map((e) => Connection.fromJson(e)).toList();

    connectionList.sort((a, b) => a.id!.compareTo(b.id!));

    return connectionList;
  }

  /// Remove a [Connection] from the shared preferences with its id
  Future removeConnection(int id) async {
    final connectionList = _preferences.getStringList(_connectionKey) ?? [];
    connectionList
        .removeWhere((element) => Connection.fromJson(element).id == id);
    await _preferences.setStringList(_connectionKey, connectionList);
    if (kDebugMode) {
      print('Connection id $id removed');
    }
  }

  /// Update a [Connection]  and push it to the shared preferences
  Future updateConnection(Connection connection) async {
    final connectionList = _preferences.getStringList(_connectionKey) ?? [];
    // find index of the connection to update
    final index = connectionList.indexWhere(
        (element) => Connection.fromJson(element).id == connection.id);
    connectionList.removeAt(index);
    connectionList.insert(index, connection.toJson());
    await _preferences.setStringList(_connectionKey, connectionList);
    if (kDebugMode) {
      print('Connection id ${connection.id} updated');
    }
  }
}
