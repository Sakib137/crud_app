import 'dart:convert';

import 'package:crudapp/models/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({super.key, required this.product});

  static const String name = "/update-new-product";

  final Product product;

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  final TextEditingController _nameTEcontroller = TextEditingController();
  final TextEditingController _priceTEcontroller = TextEditingController();
  final TextEditingController _totalPriceTEcontroller = TextEditingController();
  final TextEditingController _quantityTEcontroller = TextEditingController();
  final TextEditingController _imageTEcontroller = TextEditingController();
  final TextEditingController _codeTEcontroller = TextEditingController();
  bool _UpdateProductInProgress = false;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameTEcontroller.text = widget.product.productName ?? "";
    _priceTEcontroller.text = widget.product.unitPrice ?? "";
    _totalPriceTEcontroller.text = widget.product.totalPrice ?? "";
    _quantityTEcontroller.text = widget.product.quantity ?? "";
    _imageTEcontroller.text = widget.product.image ?? "";
    _codeTEcontroller.text = widget.product.id ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Update Product"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: build_product_form(),
      ),
    );
  }

  Widget build_product_form() {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          TextFormField(
            controller: _nameTEcontroller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              label: Text("Product Name"),
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return "Enter product name";
              } else {
                return null;
              }
            },
          ),
          TextFormField(
            controller: _priceTEcontroller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              label: Text("Product Price"),
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return "Enter product Price";
              } else {
                return null;
              }
            },
          ),
          TextFormField(
            controller: _totalPriceTEcontroller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              label: Text("Product Total Price"),
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return "Enter product total price";
              } else {
                return null;
              }
            },
          ),
          TextFormField(
            controller: _quantityTEcontroller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              label: Text("Product Quantity"),
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return "Enter product quantity";
              } else {
                return null;
              }
            },
          ),
          TextFormField(
            controller: _imageTEcontroller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              label: Text("Product Image"),
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return "Enter product image";
              } else {
                return null;
              }
            },
          ),
          TextFormField(
            controller: _codeTEcontroller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: const InputDecoration(
              label: Text("Product Code"),
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return "Enter product code";
              } else {
                return null;
              }
            },
          ),
          const SizedBox(
            height: 50,
          ),
          Visibility(
            visible: _UpdateProductInProgress == false,
            replacement: const Center(
              child: CircularProgressIndicator(),
            ),
            child: ElevatedButton(
              onPressed: () {
                if (_formkey.currentState!.validate()) {
                  _updateProduct();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text(
                "Update",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _updateProduct() async {
    _UpdateProductInProgress = true;
    setState(() {});

    Uri uri = Uri.parse(
        "https://crud.teamrabbil.com/api/v1/UpdateProduct/${widget.product.id}");

    Map<String, dynamic> requestBody = {
      "Img": _imageTEcontroller.text.trim(),
      "ProductCode": _codeTEcontroller.text.trim(),
      "ProductName": _nameTEcontroller.text.trim(),
      "Qty": _quantityTEcontroller.text.trim(),
      "TotalPrice": _totalPriceTEcontroller.text.trim(),
      "UnitPrice": _priceTEcontroller.text.trim(),
    };

    Response response = await post(
      uri,
      headers: {"content-type": "application/json"},
      body: jsonEncode(requestBody),
    );
    print(response.statusCode);
    print(response.body);
    _UpdateProductInProgress = false;
    setState(() {});
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Product has been updated"),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Product has not updated"),
        ),
      );
    }
  }

  @override
  void dispose() {
    _nameTEcontroller.dispose();
    _codeTEcontroller.dispose();
    _priceTEcontroller.dispose();
    _totalPriceTEcontroller.dispose();
    _imageTEcontroller.dispose();
    _quantityTEcontroller.dispose();
    super.dispose();
  }
}
