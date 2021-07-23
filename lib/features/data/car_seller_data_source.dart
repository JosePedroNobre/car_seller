import 'dart:convert';
import 'package:car_seller_app/network/generic/base_api.dart';
import 'package:car_seller_app/network/model/car_image.dart';
import 'package:car_seller_app/network/model/car_price.dart';
import 'package:car_seller_app/network/responses/car_response.dart';

abstract class CarSellerDataSource {
  getCars();
}

class CarSellerRemoteDataSource extends CarSellerDataSource {
  BaseApi baseApi = BaseApi();

  Future<CarResponse> getCars() async {
    try {
      var response = await baseApi.get("index.json");
      return CarResponse.fromJson(response);
    } catch (e) {
      throw e as Exception;
    }
  }
}

class CarSellerMockedDataSource extends CarSellerDataSource {
  @override
  Future<CarResponse> getCars() {
    var response = CarResponse(title: "Car Title", price: CarPrice(gross: '12€'), images: [
      CarImage(
          uri:
              "https://www.google.com/search?q=car+images&sxsrf=ALeKk006h1wOwDS2J1fI5GNstdS7QmLkdw:1627036061501&tbm=isch&source=iu&ictx=1&fir=uhxJ6c9W52vayM%252CIKrfYf69LrQuwM%252C_&vet=1&usg=AI4_-kRW2XzaRY-kcSJ2TVy_Sz8My_1aeA&sa=X&ved=2ahUKEwjv0e3T_fjxAhWy4IUKHbosDHAQ9QF6BAgMEAE#imgrc=uhxJ6c9W52vayM"),
      CarImage(
          uri:
              "https://www.google.com/search?q=car+images&sxsrf=ALeKk006h1wOwDS2J1fI5GNstdS7QmLkdw:1627036061501&tbm=isch&source=iu&ictx=1&fir=uhxJ6c9W52vayM%252CIKrfYf69LrQuwM%252C_&vet=1&usg=AI4_-kRW2XzaRY-kcSJ2TVy_Sz8My_1aeA&sa=X&ved=2ahUKEwjv0e3T_fjxAhWy4IUKHbosDHAQ9QF6BAgMEAE#imgrc=uhxJ6c9W52vayM"),
      CarImage(
          uri:
              "https://www.google.com/search?q=car+images&sxsrf=ALeKk006h1wOwDS2J1fI5GNstdS7QmLkdw:1627036061501&tbm=isch&source=iu&ictx=1&fir=uhxJ6c9W52vayM%252CIKrfYf69LrQuwM%252C_&vet=1&usg=AI4_-kRW2XzaRY-kcSJ2TVy_Sz8My_1aeA&sa=X&ved=2ahUKEwjv0e3T_fjxAhWy4IUKHbosDHAQ9QF6BAgMEAE#imgrc=uhxJ6c9W52vayM")
    ]);

    return Future.delayed(Duration(seconds: 2), () {
      return response;
    });
  }
}
