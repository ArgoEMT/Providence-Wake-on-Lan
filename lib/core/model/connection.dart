import 'dart:convert';

/// Class that represents a WOL connection.
/// 
/// By default the port is set to 9.
/// The id is set to null by default, it will be update
/// before putting the connection in the shared preferences.
class Connection {
  Connection({
    this.id,
    required this.name,
    required this.macAddress,
    required this.ipAddress,
    this.port = 9,
  });

  factory Connection.fromJson(String source) => Connection.fromMap(json.decode(source));

  factory Connection.fromMap(Map<String, dynamic> map) {
    return Connection(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      macAddress: map['macAddress'] ?? '',
      ipAddress: map['ipAddress'] ?? '',
      port: map['port']?.toInt() ?? 0,
    );
  }

  final int? id;
  final String ipAddress;
  final String macAddress;
  final String name;
  final int port;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Connection &&
      other.id == id &&
      other.name == name &&
      other.macAddress == macAddress &&
      other.ipAddress == ipAddress &&
      other.port == port;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      macAddress.hashCode ^
      ipAddress.hashCode ^
      port.hashCode;
  }

  @override
  String toString() {
    return 'Connection(id: $id, name: $name, macAddress: $macAddress, ipAddress: $ipAddress, port: $port)';
  }

  Connection copyWith({
    int? id,
    String? name,
    String? macAddress,
    String? ipAddress,
    int? port,
  }) {
    return Connection(
      id: id ?? this.id,
      name: name ?? this.name,
      macAddress: macAddress ?? this.macAddress,
      ipAddress: ipAddress ?? this.ipAddress,
      port: port ?? this.port,
    );
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'macAddress': macAddress,
      'ipAddress': ipAddress,
      'port': port,
    };
  }
}
