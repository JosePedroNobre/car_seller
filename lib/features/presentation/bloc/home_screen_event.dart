part of 'home_screen_bloc.dart';

@immutable
abstract class HomeScreenEvent {}

class GetCars extends HomeScreenEvent {
  GetCars();
}
