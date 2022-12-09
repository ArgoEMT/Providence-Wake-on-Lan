part of 'ip_bloc.dart';

abstract class IpState {}

class IpInitialState extends IpState {}

class IpLoadingState extends IpState {}

class IpLoadedState extends IpState {
  final bool success;
  IpLoadedState(this.success);
}
