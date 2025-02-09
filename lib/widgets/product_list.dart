import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:andb/models/product_model.dart';

class ProductList extends StatelessWidget {
  // final List<Product> products;
  // final String Function(String) calcStringToWon;
  //
  // const ProductList({Key? key, required this.products, required this.calcStringToWon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
    // return ListView.separated(
    //   padding: const EdgeInsets.symmetric(horizontal: 10),
    //   itemBuilder: (BuildContext context, int index) {
    //     final product = products[index];
    //
    //     return Container(
    //       padding: const EdgeInsets.symmetric(vertical: 10),
    //       child: Row(
    //         children: [
    //           ClipRRect(
    //             borderRadius: BorderRadius.all(Radius.circular(10)),
    //             child: Image.asset(product.image, width: 100, height: 100),
    //           ),
    //           Expanded(
    //             child: Container(
    //               height: 100,
    //               padding: const EdgeInsets.only(left: 20),
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Text(product.title, style: TextStyle(fontSize: 15)),
    //                   SizedBox(height: 5),
    //                   Text(product.location, style: TextStyle(fontSize: 12, color: Colors.black38)),
    //                   SizedBox(height: 5),
    //                   Text(calcStringToWon(product.price), style: TextStyle(fontWeight: FontWeight.w500)),
    //                   Expanded(
    //                     child: Row(
    //                       mainAxisAlignment: MainAxisAlignment.end,
    //                       children: [
    //                         SvgPicture.asset("assets/svg/heart_off.svg", width: 13, height: 13),
    //                         SizedBox(width: 5),
    //                         Text(product.likes),
    //                       ],
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           )
    //         ],
    //       ),
    //     );
    //   },
    //   separatorBuilder: (BuildContext context, int index) => Container(height: 1, color: Colors.black26),
    //   itemCount: products.length,
    // );
  }
}
