import 'package:flutter/material.dart';
import 'package:shop_app_flutter/providers/cart_provider.dart';
import 'package:shop_app_flutter/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        title: 'Shopping App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Lato',
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 206, 206, 1),
            primary: const Color.fromARGB(255, 233, 233, 1),
          ),
          appBarTheme: AppBarTheme(
              titleTextStyle: TextStyle(
            fontSize: 20,
            color: Colors.black,
          )),
          inputDecorationTheme: InputDecorationTheme(
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
          ),
          textTheme: TextTheme(
            titleMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            titleSmall: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
            titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
          ),
          useMaterial3: true,
        ),
        home: MyHomePage(),
      ),
    );
  }
}
