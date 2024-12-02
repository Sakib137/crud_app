// Widget extraction

import 'package:flutter/material.dart';

class listItem extends StatelessWidget {
  const listItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
          "https://upload.wikimedia.org/wikipedia/en/e/ee/Front_%26_Back_Face_of_iPhone_16_Pro_Max.png"),
      title: const Text("Item name: Iphone"),
      subtitle: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Product Code: #afdhk"),
          Text("Product Quantity: 5"),
          Text("Price: 16445"),
          Text("Total price: 54644"),
        ],
      ),
      trailing: Wrap(
        children: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
        ],
      ),
    );
  }
}
