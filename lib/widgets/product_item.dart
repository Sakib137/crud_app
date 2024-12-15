// Widget extraction

import 'package:crudapp/models/product.dart';
import 'package:crudapp/screens/update_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:crudapp/models/delete_function.dart';

class listItem extends StatelessWidget {
  const listItem({super.key, required this.product, required this.onRefresh});

  final Product product;
  final Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        product.image ?? "",
        width: 40,
      ),
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
            onPressed: () {
              DeleteFunction.showDeleteConfirmation(
                context: context,
                id: product.id ?? '',
                productName: product.productName ?? 'Unknown',
                productCode: product.productCode ?? 'Unknown',
                quantity: product.quantity?.toString() ?? 'Unknown',
                price: product.unitPrice?.toString() ?? 'Unknown',
                totalPrice: product.totalPrice?.toString() ?? 'Unknown',
                imageUrl: product.image,
                onDeleteSuccess: onRefresh, // Use the passed refresh function
              );
            },
            icon: const Icon(Icons.delete),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                UpdateProductScreen.name,
                arguments: product,
              );
            },
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
    );
  }
}
