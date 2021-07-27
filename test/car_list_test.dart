import 'package:bloc_test/bloc_test.dart';
import 'package:car_seller_app/features/data/car_seller_data_source.dart';
import 'package:car_seller_app/features/data/car_seller_repository.dart';
import 'package:car_seller_app/features/presentation/bloc/car_bloc.dart';
import 'package:test/test.dart';

void main() {
  group('Car Bloc Integration testing', () {
    blocTest(
      'emits [CarScreenLoading && CarScreenLoaded] when cars are loaded with success',
      build: () async => CarBloc(CarSellerRepository(CarSellerRemoteDataSource())),
      act: (bloc) => bloc.add(GetCars()),
      expect: () => [CarScreenLoading(), CarScreenLoaded()],
    );
  });
}
