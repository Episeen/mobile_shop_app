import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_selling_app/features/cart/bloc/cart_bloc.dart';
import 'package:phone_selling_app/features/cart/pages/cart_page.dart';
import 'package:phone_selling_app/features/home/bloc/home_bloc.dart';
import 'package:phone_selling_app/features/phone_details/bloc/details_bloc.dart';
import 'package:phone_selling_app/features/phone_details/pages/details_page.dart';
import 'package:phone_selling_app/utils/app_colors.dart';
import 'package:phone_selling_app/utils/app_text_styles.dart';
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
        theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              elevation: MaterialStatePropertyAll(3),
              textStyle: MaterialStatePropertyAll(
                AppTextStyles.txt20w700.copyWith(color: Colors.white),
              ),
              padding: const MaterialStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
              backgroundColor: const MaterialStatePropertyAll(AppColors.colorOrange),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ),
        home: const MyHomePage(),
        initialRoute: 'home_page',
        routes: {
          'home_page': (context) => const MyHomePage(),
          'cart_page': (context) => const CartPage(),
          'details_page': (context) => const DetailsPage(),
        },
      ),
    );
  }
}
