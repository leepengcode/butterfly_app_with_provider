import 'package:butterfly_shop/models/category.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(categoriesList[index].image),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                height: 15,
                child: Text(categoriesList[index].title),
              )
            ],
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          width: 25,
        ),
      ),
    );
  }
}
