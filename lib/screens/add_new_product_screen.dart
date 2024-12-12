import 'package:flutter/material.dart';

class AddNewProductScreen extends StatefulWidget {
  const AddNewProductScreen({super.key});

  static const String name = "/add-new-product";

  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {
  final TextEditingController _nameTEcontroller = TextEditingController();
  final TextEditingController _priceTEcontroller = TextEditingController();
  final TextEditingController _totalPriceTEcontroller = TextEditingController();
  final TextEditingController _quantityTEcontroller = TextEditingController();
  final TextEditingController _imageTEcontroller = TextEditingController();
  final TextEditingController _codeTEcontroller = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Add new Product"),
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
          ElevatedButton(
            onPressed: () {
              if (_formkey.currentState!.validate()) {}
            },
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }
}
