import 'package:car_seller_app/features/presentation/bloc/car_bloc.dart';
import 'package:car_seller_app/features/presentation/car_details.dart';
import 'package:car_seller_app/image_utils.dart';
import 'package:car_seller_app/network/model/car_image.dart';
import 'package:car_seller_app/network/responses/car_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarListScreen extends StatefulWidget {
  const CarListScreen({Key? key}) : super(key: key);

  @override
  _CarListScreenState createState() => _CarListScreenState();
}

class _CarListScreenState extends State<CarListScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CarBloc>(context).add(GetCars());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _buildConsumer(),
        appBar: AppBar(
          title: Text("Car List"),
        ));
  }

  _buildConsumer() {
    return BlocConsumer<CarBloc, HomeScreenState>(
        listenWhen: (previous, current) {
          return false;
        },
        listener: (context, state) {},
        buildWhen: (previous, current) =>
            current is CarScreenError || current is CarScreenLoading || current is CarScreenLoaded,
        builder: (context, state) {
          if (state is CarScreenLoading) {
            _buildLoading();
          }

          if (state is CarScreenLoaded) {
            return _buildCarBody(state.carResponse);
          }

          if (state is CarScreenError) {
            return _buildErrorScreen();
          }

          return Container();
        });
  }

  _buildCarBody(CarResponse? carResponse) {
    return carResponse != null
        ? Column(
            children: [
              Text(carResponse.title ?? "N/A"),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: false,
                  itemCount: carResponse.images?.length ?? 0,
                  itemBuilder: (context, index) {
                    final item = carResponse.images?[index];
                    return _buildCarItem(item);
                  },
                ),
              ),
            ],
          )
        : _buildEmptyState();
  }

  _buildCarItem(CarImage? carImage) {
    return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CarDetails(carImage: carImage)),
          );
        },
        child: Card(child: Image.network(getImage(carImage, ImageSize.NORMAL))));
  }

  _buildLoading() {
    return Center(child: CircularProgressIndicator());
  }

  _buildEmptyState() {
    return Center(child: Text("No cars to load"));
  }

  _buildErrorScreen() {
    return Center(child: Text("Error while loading cars"));
  }
}
