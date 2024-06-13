import 'package:butterfly_shop/Component/constant.dart';
import 'package:butterfly_shop/Provider/favoriteProvider.dart';
import 'package:butterfly_shop/models/product.dart';
import 'package:butterfly_shop/screens/detail/detailScreen.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  final Product product;
  ProductWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(product: product),
            ));
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: bgColor),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5,
              ),
              Center(
                child: Hero(
                  tag: product.image,
                  child: Image.asset(
                    product.image,
                    fit: BoxFit.contain,
                    height: 170,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                product.title,
                style: TitleStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "\$${product.price}",
                    style: HeaderStyle,
                  ),
                  Row(
                    children: <Widget>[
                      ...List.generate(
                        product.colors.length,
                        (index) => Container(
                          width: 15,
                          height: 15,
                          margin: const EdgeInsets.only(right: 4),
                          decoration: BoxDecoration(
                              color: product.colors[index],
                              shape: BoxShape.circle),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
          Positioned(
              child: Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(10),
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  provider.toggleFavorite(product);
                },
                child: provider.isExist(product)
                    ? const Icon(Icons.favorite, color: Colors.red)
                    : const Icon(Icons.favorite_border_outlined),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
