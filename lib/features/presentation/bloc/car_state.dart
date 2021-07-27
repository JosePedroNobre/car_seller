part of 'car_bloc.dart';

@immutable
abstract class HomeScreenState {}

class CarScreenInitial extends HomeScreenState {}

class CarScreenLoading extends HomeScreenState {}

class CarScreenLoaded extends HomeScreenState {
  final CarResponse? carResponse;

  CarScreenLoaded({this.carResponse});
}

class CarScreenError extends HomeScreenState {
  final String? message;
  CarScreenError({this.message});
}
