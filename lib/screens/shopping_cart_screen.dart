import 'package:flutter/material.dart';

import '../custom_ui/product_card.dart';
import '../model/product.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key, required this.productsList});

  final List<Product> productsList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar started
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              // Home Button Handle
            },
            icon: const Icon(Icons.home)),

        //Title Name
        title: const Text(
          'Shopping Cart',
        ),
        centerTitle: true,
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Buy Handle
        },
        label: const Text('Buy Now'),
        icon: const Icon(Icons.shopping_cart_checkout_rounded),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      //Start The Body
      body: ListView.builder(
        itemCount: productsList.length,
        itemBuilder: (context, index) {
          return ProductCard(
            product: productsList[index],
          );
        },
      ),
    );
  }
}
