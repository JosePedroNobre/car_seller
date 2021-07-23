import 'package:car_seller_app/network/model/car_image.dart';
import 'package:car_seller_app/network/model/car_price.dart';

class CarResponse {
  String? title;
  List<CarImage>? images;
  CarPrice? price;

  CarResponse({this.title, this.images, this.price});

  factory CarResponse.fromJson(Map<String, dynamic> json) => CarResponse(
        title: json["title"],
        price: CarPrice.fromJson(json["price"]),
        images: List<CarImage>.from(json["images"].map((x) => CarImage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "price": price!.toJson(),
        "images": List<dynamic>.from(images!.map((x) => x.toJson())),
      };
}
