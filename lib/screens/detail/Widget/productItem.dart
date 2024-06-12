import 'package:butterfly_shop/Component/constant.dart';
import 'package:butterfly_shop/models/product.dart';
import 'package:flutter/material.dart';

class productItem extends StatelessWidget {
  final Product product;
  var currentColor = 0;
  productItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.title,
          style: HeaderStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\$${product.price}',
              style: HeaderStyle,
            ),
            Row(
              children: [
                Text(
                  "Seller : ",
                  style: HeaderStyle,
                ),
                Text(
                  product.seller,
                  style: HeaderStyle,
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 25,
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(50)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star_border,
                    size: 20,
                    color: Colors.white,
                  ),
                  Text(
                    '${product.rate}',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              product.review,
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Color",
          style: HeaderStyle,
        ),
      ],
    );
  }
}
