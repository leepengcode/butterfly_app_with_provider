import 'package:butterfly_shop/screens/cart/cartScreen.dart';
import 'package:butterfly_shop/screens/detail/detailScreen.dart';
import 'package:butterfly_shop/screens/favorite/favoriteScreen.dart';
import 'package:butterfly_shop/screens/home/homeScreen.dart';
import 'package:butterfly_shop/screens/profile/profileScreen.dart';
import 'package:flutter/material.dart';

class ButtomNavigation extends StatefulWidget {
  const ButtomNavigation({super.key});

  @override
  State<ButtomNavigation> createState() => _ButtomNavigationState();
}

class _ButtomNavigationState extends State<ButtomNavigation> {
  int currentIndex = 2;
  late List Screens = const [
    DetailScreen(),
    FavoriteScreen(),
    HomeScreen(),
    CartScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            currentIndex = 2;
          });
        },
        shape: CircleBorder(),
        backgroundColor: Color.fromARGB(137, 211, 211, 211),
        child: Icon(
          Icons.home_outlined,
          size: 35,
          color: currentIndex == 2 ? Colors.blue : Colors.black54,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 2,
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        color: const Color.fromARGB(137, 211, 211, 211),
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(
                Icons.category_outlined,
                color: currentIndex == 0 ? Colors.blue : Colors.black54,
                size: 35,
              ),
              onPressed: () {
                setState(() {
                  currentIndex = 0;
                });
              },
            ),
            IconButton(
              icon: Icon(
                Icons.favorite_outline,
                color: currentIndex == 1 ? Colors.blue : Colors.black54,
                size: 35,
              ),
              onPressed: () {
                setState(() {
                  currentIndex = 1;
                });
              },
            ),
            const SizedBox(
              width: 20,
            ),
            IconButton(
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: currentIndex == 3 ? Colors.blue : Colors.black54,
                size: 35,
              ),
              onPressed: () {
                setState(() {
                  currentIndex = 3;
                });
              },
            ),
            IconButton(
              icon: Icon(
                Icons.person_2_outlined,
                color: currentIndex == 4 ? Colors.blue : Colors.black54,
                size: 35,
              ),
              onPressed: () {
                setState(() {
                  currentIndex = 4;
                });
              },
            ),
          ],
        ),
      ),
      body: Screens[currentIndex],
    );
  }
}
