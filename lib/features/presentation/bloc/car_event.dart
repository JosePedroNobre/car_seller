part of 'car_bloc.dart';

@immutable
abstract class CarEvent {}

class GetCars extends CarEvent {
  GetCars();
}
