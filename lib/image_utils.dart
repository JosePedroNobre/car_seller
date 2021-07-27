import 'network/model/car_image.dart';

enum ImageSize { NORMAL, LARGE }

String getImage(CarImage? carImage, ImageSize imageSize) {
  switch (imageSize) {
    case ImageSize.NORMAL:
      return '${carImage?.uri}_2.jpg';
    case ImageSize.LARGE:
      return '${carImage?.uri}_27.jpg';
    default:
      return "";
  }
}
