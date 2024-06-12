import 'package:butterfly_shop/Component/constant.dart';
import 'package:butterfly_shop/models/product.dart';
import 'package:butterfly_shop/screens/detail/detailScreen.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatefulWidget {
  final Product product;
  ProductWidget({super.key, required this.product});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(product: widget.product),
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
                  tag: widget.product.image,
                  child: Image.asset(
                    widget.product.image,
                    fit: BoxFit.contain,
                    height: 170,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.product.title,
                style: TitleStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "\$${widget.product.price}",
                    style: HeaderStyle,
                  ),
                  Row(
                    children: <Widget>[
                      ...List.generate(
                        widget.product.colors.length,
                        (index) => Container(
                          width: 15,
                          height: 15,
                          margin: const EdgeInsets.only(right: 4),
                          decoration: BoxDecoration(
                              color: widget.product.colors[index],
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
                  setState(() {
                    isLiked = !isLiked;
                  });
                },
                child: isLiked
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
