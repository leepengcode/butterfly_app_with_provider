// import 'package:butterfly_shop/models/category.dart';
// import 'package:flutter/material.dart';

// class CategoryWidget extends StatefulWidget {
//   const CategoryWidget({super.key});

//   @override
//   State<CategoryWidget> createState() => _CategoryWidgetState();
// }

// class _CategoryWidgetState extends State<CategoryWidget> {
//   var selectedIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 100,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: categoriesList.length,
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             onTap: () {
//               setState(() {
//                 selectedIndex = index;
//               });
//             },
//             child: Container(
//               padding: const EdgeInsets.all(5),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   color: selectedIndex == index
//                       ? Color.fromARGB(255, 184, 184, 184)
//                       : Colors.transparent),
//               child: Column(
//                 children: [
//                   Container(
//                     width: 65,
//                     height: 65,
//                     decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         image: DecorationImage(
//                             image: AssetImage(categoriesList[index].image),
//                             fit: BoxFit.cover)),
//                   ),
//                   SizedBox(
//                     height: 15,
//                     child: Text(categoriesList[index].title),
//                   )
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
