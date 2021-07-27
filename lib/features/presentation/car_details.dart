import 'package:car_seller_app/image_utils.dart';
import 'package:car_seller_app/network/model/car_image.dart';
import 'package:flutter/material.dart';

class CarDetails extends StatelessWidget {
  final CarImage? carImage;

  const CarDetails({this.carImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Car Details"),
      ),
      backgroundColor: Colors.black,
      body: _buildBody(),
    );
  }

  _buildBody() {
    return Center(child: Image.network(getImage(carImage, ImageSize.LARGE)));
  }
}
