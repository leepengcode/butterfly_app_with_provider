import 'package:butterfly_shop/Component/ButtomNavigation.dart';
import 'package:butterfly_shop/Provider/CartProvider.dart';
import 'package:butterfly_shop/Provider/favoriteProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  ;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => FavoriteProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:
            ButtomNavigation(), // Replace with your actual bottom navigation widget
      ),
    );
  }
}
