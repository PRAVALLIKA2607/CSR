import 'package:flutter/material.dart';
import 'package:project/widget/custom_simple_rounded_button.dart';
import 'package:project/widget/custom_square_button.dart';
import 'package:project/widget/product_information_widget.dart';

import '../model/product_model.dart';
import '../utils/color_themes.dart';
import '../utils/utils.dart';

class CartItemWidget extends StatelessWidget {
  final ProductModel product;
  const CartItemWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();

    return Container(
      padding: const EdgeInsets.all(20),
      height: screenSize.height / 2,
      width: screenSize.width,
      decoration: const BoxDecoration(
        color: backgroundColor,
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 1),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            // ignore: sort_child_properties_last
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: screenSize.width / 4,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Center(
                      child: Image.network(product.url),
                    ),
                  ),
                ),
                ProductInformationWidget(
                  productName: product.productName,
                  cost: product.cost,
                  sellerName: product.sellerName,
                )
              ],
            ),
            flex: 3,
          ),
          Expanded(
            child: Row(
              children: [
                CustomSquareButton(
                    child: Icon(Icons.remove),
                    onPressed: () {},
                    color: backgroundColor,
                    dimension: 40),
                CustomSquareButton(
                    child: const Text(
                      "0",
                      style: TextStyle(
                        color: activeCyanColor,
                      ),
                    ),
                    onPressed: () {},
                    color: Colors.white,
                    dimension: 40),
                CustomSquareButton(
                    child: const Icon(Icons.add),
                    onPressed: () {},
                    color: backgroundColor,
                    dimension: 40),
              ],
            ),
            flex: 1,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Row(
                  children: [
                    CustomSimpleRoundedButton(onPressed: () {}, text: "Delete"),
                    const SizedBox(
                      width: 5,
                    ),
                    CustomSimpleRoundedButton(
                        onPressed: () {}, text: "Save for later"),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "See more of this",
                      style: TextStyle(color: activeCyanColor, fontSize: 12),
                    ),
                  ),
                ),
              ]),
            ),
            flex: 5,
          ),
        ],
      ),
    );
  }
}

