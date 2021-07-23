part of 'home_screen_bloc.dart';

@immutable
abstract class HomeScreenState {}

class HomeScreenInitial extends HomeScreenState {}

class HomeScreenLoading extends HomeScreenState {}

class HomeScreenLoaded extends HomeScreenState {
  final CarResponse? carResponse;

  HomeScreenLoaded({this.carResponse});
}

class HomeScreenError extends HomeScreenState {
  final String? message;
  HomeScreenError({this.message});
}
