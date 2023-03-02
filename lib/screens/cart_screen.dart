import 'package:flutter/material.dart';
import '../model/product_model.dart';
import '../utils/color_themes.dart';
import '../widget/cart_item_widget.dart';
import '../widget/custom_main_button.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  get isLoading => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            /*UserDetailsBar(
              offset: 0,
              userDetails: UserDetailsModel(name: "Prav", address: "bcoudhcsd"),
            ),*/
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomMainButton(
                  child: Text(
                    "Proceed to by (n) items",
                    style: TextStyle(color: Colors.black),
                  ),
                  color: yellowColor,
                  isLoading: false,
                  onPressed: () {}),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return CartItemWidget(
                      product: ProductModel(
                        url:
                            "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png",
                        productName: "Rick",
                        cost: 546474,
                        discount: 0,
                        uid: "hfhfurjfn",
                        sellerName: "Rick seller",
                        sellerUid: "64638h4849hgt",
                        rating: 1,
                        noOfRating: 3,
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
