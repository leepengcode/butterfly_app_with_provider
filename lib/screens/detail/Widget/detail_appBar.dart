import 'package:flutter/material.dart';

class DetailAppBar extends StatefulWidget {
  const DetailAppBar({super.key});

  @override
  State<DetailAppBar> createState() => _DetailAppBarState();
}

class _DetailAppBarState extends State<DetailAppBar> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
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
              setState(() {
                isLiked = !isLiked;
              });
            },
            icon: isLiked
                ? const Icon(Icons.favorite, color: Colors.red)
                : const Icon(Icons.favorite_border_outlined),
          )
        ],
      ),
    );
  }
}
