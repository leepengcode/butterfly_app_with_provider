import 'package:flutter/material.dart';

class MyImageSlider extends StatelessWidget {
  final Function(int) onChange;
  final List<String> images;
  final int itemCount;

  const MyImageSlider({
    super.key,
    required this.images,
    required this.onChange,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) {
      return Center(
        child: Text('No images available'),
      );
    }

    return SizedBox(
      height: 250,
      child: PageView.builder(
        physics: const ClampingScrollPhysics(),
        onPageChanged: onChange,
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return Hero(
            tag: images[index %
                images
                    .length], // Cycle through images if itemCount is greater than images length
            child: Image.asset(images[index % images.length]),
          );
        },
      ),
    );
  }
}
