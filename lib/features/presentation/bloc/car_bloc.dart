import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:car_seller_app/features/data/car_seller_repository.dart';
import 'package:car_seller_app/network/responses/car_response.dart';
import 'package:meta/meta.dart';

part 'car_event.dart';
part 'car_state.dart';

class CarBloc extends Bloc<CarEvent, HomeScreenState> {
  CarSellerRepository _repository;

  CarBloc(this._repository) : super(CarScreenInitial());

  @override
  Stream<HomeScreenState> mapEventToState(
    CarEvent event,
  ) async* {
    try {
      if (event is GetCars) {
        yield CarScreenLoading();
        var response = await _repository.getCars();
        yield CarScreenLoaded(carResponse: response);
      }
    } catch (e) {
      yield CarScreenError(message: e.toString());
    }
  }
}
