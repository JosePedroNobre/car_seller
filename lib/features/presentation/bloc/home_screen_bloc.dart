import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:car_seller_app/features/data/car_seller_repository.dart';
import 'package:car_seller_app/network/responses/car_response.dart';
import 'package:meta/meta.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  CarSellerRepository _repository;

  HomeScreenBloc(this._repository) : super(HomeScreenInitial());

  @override
  Stream<HomeScreenState> mapEventToState(
    HomeScreenEvent event,
  ) async* {
    try {
      if (event is GetCars) {
        yield HomeScreenLoading();
        var response = await _repository.getCars();
        yield HomeScreenLoaded(carResponse: response);
      }
    } catch (e) {
      yield HomeScreenError(message: e.toString());
    }
  }
}
