part of 'home_screen_bloc.dart';

abstract class HomeScreenEvent {}

class HomeScreenLoadConnectionsEvent extends HomeScreenEvent {}

class HomeScreenRemoveConnectionEvent extends HomeScreenEvent {
  HomeScreenRemoveConnectionEvent(this.connectionId);

  final int connectionId;
}
