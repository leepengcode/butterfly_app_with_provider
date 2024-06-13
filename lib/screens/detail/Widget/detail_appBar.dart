import 'package:butterfly_shop/Provider/favoriteProvider.dart';
import 'package:butterfly_shop/models/product.dart';
import 'package:flutter/material.dart';

class DetailAppBar extends StatelessWidget {
  final Product product;
  const DetailAppBar({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          IconButton(
              style: IconButton.styleFrom(
                backgroundColor: const Color.fromARGB(137, 211, 211, 211),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_outlined,
                size: 20,
              )),
          const Spacer(),
          IconButton(
              style: IconButton.styleFrom(
                backgroundColor: const Color.fromARGB(137, 211, 211, 211),
              ),
              onPressed: () {},
              icon: const Icon(
                Icons.share_outlined,
                size: 20,
              )),
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: const Color.fromARGB(137, 211, 211, 211),
            ),
            onPressed: () {
              provider.toggleFavorite(product);
            },
            icon: provider.isExist(product)
                ? const Icon(Icons.favorite, color: Colors.red)
                : const Icon(Icons.favorite_border_outlined),
          )
        ],
      ),
    );
  }
}
