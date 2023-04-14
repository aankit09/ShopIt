import 'package:flutter/material.dart';

import '../model/product.dart';
import '../screens/add_product_screen.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.product.isAdded ? Colors.blue[100] : null,
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(10)),
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: mq.height * .015),
      child: ListTile(
        contentPadding: EdgeInsets.only(
            left: mq.width * .04,
            right: mq.width * .02,
            bottom: mq.width * .01,
            top: mq.width * .01),
        leading: Image.asset('assets/images/${widget.product.image}'),
        title: Text(widget.product.title),
        subtitle: Text('₹ ${widget.product.price}.00'),
        trailing: widget.product.isAdded
            ? IconButton(
                onPressed: () {
                  setState(() {
                    widget.product.isAdded = false;
                  });

                  // Normal Snack Bar
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Item Removed Successfully'),
                      backgroundColor: Colors.blue,
                    ),
                  );
                },
                icon: Image.asset('assets/images/done.png'))
            : ElevatedButton.icon(
                onPressed: () {
                  //List Handle
                  setState(() {
                    widget.product.isAdded = true;
                  });
                  // Transparent SnackBar
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Item Added Successfully'),
                      backgroundColor: Colors.blue.withOpacity(.8),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                    elevation: 5, shape: const StadiumBorder()),
                icon: const Icon(Icons.shopping_basket_rounded),
                label: const Text('Add'),
              ),
      ),
    );
  }
}
