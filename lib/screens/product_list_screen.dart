import 'dart:convert';

import 'package:crudapp/models/product.dart';
import 'package:crudapp/screens/add_new_product_screen.dart';
import 'package:crudapp/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _CrudAppState();
}

class _CrudAppState extends State<ProductListScreen> {
  List<Product> productList = [];
  bool _getProductListInProgress = false;

  @override
  void initState() {
    super.initState();
    _getProductList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Product List"),
        ),
      ),
      body: Visibility(
        visible: _getProductListInProgress == false,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
            itemCount: productList.length,
            itemBuilder: (context, index) {
              return listItem(
                product: productList[index],
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddNewProductScreen.name);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _getProductList() async {
    _getProductListInProgress = true;
    setState(() {});
    Uri uri = Uri.parse("https://crud.teamrabbil.com/api/v1/ReadProduct");
    Response response = await get(uri);
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      final decodeData = jsonDecode(response.body);
      print(decodeData["status"]);
      for (Map<String, dynamic> p in decodeData["data"]) {
        Product product = Product(
          id: p["_id"],
          productName: p["ProductName"],
          productCode: p["ProductCode"],
          image: p["Img"],
          quantity: p["Qty"],
          unitPrice: p["UnitPrice"],
          totalPrice: p["TotalPrice"],
          createdDate: p["CreatedDate"],
        );
        productList.add(product);
      }
      setState(() {});
    }
    _getProductListInProgress = false;
    setState(() {});
  }
}
