import 'package:butterfly_shop/Component/constant.dart';
import 'package:butterfly_shop/models/category.dart';
import 'package:butterfly_shop/models/product.dart';
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
  var selectedIndex = 0;

  void onPageChanged(int index) {
    setState(() {
      currentSlide = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<List<Product>> selectedCategories = [
      all,
      shoes,
      beauty,
      womenFashion,
      jewelry,
      menFashion
    ];
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
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoriesList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: selectedIndex == index
                                ? Color.fromARGB(255, 184, 184, 184)
                                : Colors.transparent),
                        child: Column(
                          children: [
                            Container(
                              width: 65,
                              height: 65,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          categoriesList[index].image),
                                      fit: BoxFit.cover)),
                            ),
                            SizedBox(
                              height: 15,
                              child: Text(categoriesList[index].title),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
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
                itemCount: selectedCategories[selectedIndex].length,
                itemBuilder: (context, index) {
                  return ProductWidget(
                      product: selectedCategories[selectedIndex][index]);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
