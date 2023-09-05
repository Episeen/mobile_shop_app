import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_selling_app/features/cart/bloc/cart_bloc.dart';
import 'package:phone_selling_app/features/cart/pages/cart_page.dart';
import 'package:phone_selling_app/features/home/bloc/home_bloc.dart';
import 'package:phone_selling_app/features/phone_details/bloc/details_bloc.dart';
import 'package:phone_selling_app/features/phone_details/pages/details_page.dart';
import 'core/services/api.dart';
import 'features/home/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Api api = Api();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeBloc(api)),
        BlocProvider(create: (context) => CartBloc(api)),
        BlocProvider(create: (context) => DetailsBloc(api)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
        initialRoute: 'home_page',
        routes: {
          'home_page': (context) => MyHomePage(),
          'cart_page': (context) => CartPage(),
          'details_page': (context) => DetailsPage(),
        },
      ),
    );
  }
}
