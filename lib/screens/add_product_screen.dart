import 'package:flutter/material.dart';
import 'package:shop_it/custom_ui/product_card.dart';
import 'package:shop_it/screens/shopping_cart_screen.dart';

import '../model/product.dart';

//For getting device width and higth

late Size mq;

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  //All Items are available for products
  final List<Product> productsList = [
    Product(title: 'Cap', price: '350', image: 'cap.png'),
    Product(title: 'Handbag', price: '150', image: 'handbag.png'),
    Product(title: 'Puzzle', price: '750', image: 'puzzle.png'),
    Product(title: 'Backpack', price: '120', image: 'backpack.png'),
    Product(title: 'Rocking Horse', price: '910', image: 'rocking_horse.png'),
    Product(title: 'Smart Watch', price: '1350', image: 'smart_watch.png'),
    Product(title: 'Sneakers', price: '450', image: 'sneakers.png'),
    Product(title: 'T-Shirt', price: '670', image: 't_shirt.png'),
  ];

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
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
          'Add Product',
        ),
        centerTitle: true,

        // Action Icons Button
        actions: [
          IconButton(
              onPressed: () {
                // Search Button Handle
              },
              icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {
                // Shopping Button Handle
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ShoppingCartScreen(
                              productsList: productsList
                                  .where((e) => e.isAdded == true)
                                  .toList(),
                            ))).then((value) {
                  setState(() {
                    productsList;
                  });
                });
              },
              icon: const Icon(Icons.shopping_bag)),
        ],
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Cart Handle
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => ShoppingCartScreen(
                        productsList: productsList
                            .where((e) => e.isAdded == true)
                            .toList(),
                      ))).then((value) {
            setState(() {
              productsList;
            });
          });
        },
        label: const Text('Open Cart'),
        icon: const Icon(Icons.shopping_basket),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      // Start The Body
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
