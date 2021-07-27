import 'package:car_seller_app/features/data/car_seller_data_source.dart';
import 'package:car_seller_app/features/data/car_seller_repository.dart';
import 'package:car_seller_app/features/presentation/bloc/car_bloc.dart';
import 'package:car_seller_app/features/presentation/car_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CarBloc>(
          create: (context) => CarBloc(CarSellerRepository(CarSellerRemoteDataSource())),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: CarListScreen(),
      ),
    );
  }
}
