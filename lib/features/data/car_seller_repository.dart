import 'package:car_seller_app/features/data/car_seller_data_source.dart';

class CarSellerRepository {
  CarSellerDataSource? _dataSource;

  CarSellerRepository(this._dataSource);

  getCars() => _dataSource?.getCars();
}
