import 'package:car_seller_app/features/presentation/bloc/home_screen_bloc.dart';
import 'package:car_seller_app/network/model/car_image.dart';
import 'package:car_seller_app/network/responses/car_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeScreenBloc>(context).add(GetCars());
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
    return BlocConsumer<HomeScreenBloc, HomeScreenState>(
        listenWhen: (previous, current) {
          return false;
        },
        listener: (context, state) {},
        buildWhen: (previous, current) =>
            current is HomeScreenError || current is HomeScreenLoading || current is HomeScreenLoaded,
        builder: (context, state) {
          if (state is HomeScreenLoading) {
            _buildLoading();
          }

          if (state is HomeScreenLoaded) {
            return _buildCarBody(state.carResponse);
          }

          if (state is HomeScreenError) {
            return _buildErrorScreen();
          }

          return Container();
        });
  }

  _buildCarBody(CarResponse? carResponse) {
    return carResponse != null
        ? Column(
            children: [
              Text(carResponse.title ?? ""),
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
    return Card(child: Image.network(carImage?.uri ?? ""));
  }

  _buildLoading() {
    return Center(child: CircularProgressIndicator());
  }

  _buildEmptyState() {
    return Center(child: Text("No car to load"));
  }

  _buildErrorScreen() {
    return Center(child: Text("Error while Loading"));
  }
}
