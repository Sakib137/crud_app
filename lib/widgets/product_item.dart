// Widget extraction

import 'package:crudapp/models/product.dart';
import 'package:crudapp/screens/update_product_screen.dart';
import 'package:flutter/material.dart';

class listItem extends StatelessWidget {
  const listItem({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(product.image ?? ""),
      title: Text("Item name: ${product.productName ?? ""}"),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Product Code: ${product.productCode ?? ""}"),
          Text("Product Quantity: ${product.quantity ?? ""}"),
          Text("Price: ${product.unitPrice ?? ""}"),
          Text("Total price: ${product.totalPrice}"),
        ],
      ),
      trailing: Wrap(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, UpdateProductScreen.name);
            },
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
    );
  }
}
