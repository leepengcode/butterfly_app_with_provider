import 'package:butterfly_shop/Component/constant.dart';
import 'package:butterfly_shop/models/product.dart';
import 'package:butterfly_shop/screens/home/Widget/Category.dart';
import 'package:butterfly_shop/screens/home/Widget/ImageSlider.dart';
import 'package:butterfly_shop/screens/home/Widget/ProductCart.dart';
import 'package:butterfly_shop/screens/home/Widget/SearchBAR.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var currentSlide = 0;

  void onPageChanged(int index) {
    setState(() {
      currentSlide = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      style: IconButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(137, 211, 211, 211),
                      ),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.view_module_rounded,
                        size: 30,
                      )),
                  IconButton(
                      style: IconButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(137, 211, 211, 211),
                      ),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications_none_rounded,
                        size: 30,
                      ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const MySearchBAR(),
              const SizedBox(
                height: 20,
              ),
              ImageSlider(currentSlide: currentSlide, onChange: onPageChanged),
              const SizedBox(
                height: 15,
              ),
              const CategoryWidget(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Special For You",
                    style: HeaderStyle,
                  ),
                  Text(
                    "See All",
                    style: SubStyle,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductWidget(product: products[index]);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
