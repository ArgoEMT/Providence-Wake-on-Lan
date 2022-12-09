part of 'ip_bloc.dart';

abstract class IpEvent {}

class IpPingEvent extends IpEvent {
  final String ipAddress;

  IpPingEvent(this.ipAddress);
}