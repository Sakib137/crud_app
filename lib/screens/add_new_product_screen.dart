import 'dart:convert';

import 'package:crudapp/screens/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

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

  bool _AddNewProductInProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 1, 35, 66),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Center(
          child: Text(
            "Add new Product",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 193, 191, 178),
              Color.fromARGB(255, 113, 116, 152), // Dark blue at the top
              Color.fromARGB(255, 23, 42, 59), // Lighter blue at the bottom
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: buildProductForm(),
        ),
      ),
    );
  }

  Widget buildProductForm() {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _nameTEcontroller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              fillColor: const Color.fromARGB(255, 144, 140, 140),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                    color: Color.fromARGB(255, 218, 221, 19), width: 2),
              ),
              label: const Text(
                "Product Name",
                style: TextStyle(
                  color: Color.fromARGB(255, 52, 2, 2),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return "Enter product name";
              } else {
                return null;
              }
            },
          ),
          const SizedBox(
            height: 12,
          ),
          TextFormField(
            controller: _priceTEcontroller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              fillColor: const Color.fromARGB(255, 144, 140, 140),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                    color: Color.fromARGB(255, 218, 221, 19), width: 2),
              ),
              label: const Text(
                "Product Price",
                style: TextStyle(
                  color: Color.fromARGB(255, 52, 2, 2),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return "Enter product Price";
              } else {
                return null;
              }
            },
          ),
          const SizedBox(
            height: 12,
          ),
          TextFormField(
            controller: _totalPriceTEcontroller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              fillColor: const Color.fromARGB(255, 144, 140, 140),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                    color: Color.fromARGB(255, 218, 221, 19), width: 2),
              ),
              label: const Text(
                "Product Total Price",
                style: TextStyle(
                  color: Color.fromARGB(255, 52, 2, 2),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return "Enter product total price";
              } else {
                return null;
              }
            },
          ),
          const SizedBox(
            height: 12,
          ),
          TextFormField(
            controller: _quantityTEcontroller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              fillColor: const Color.fromARGB(255, 144, 140, 140),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                    color: Color.fromARGB(255, 218, 221, 19), width: 2),
              ),
              label: const Text(
                "Product Quantity",
                style: TextStyle(
                  color: Color.fromARGB(255, 52, 2, 2),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return "Enter product quantity";
              } else {
                return null;
              }
            },
          ),
          const SizedBox(
            height: 12,
          ),
          TextFormField(
            controller: _imageTEcontroller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              fillColor: const Color.fromARGB(255, 144, 140, 140),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                    color: Color.fromARGB(255, 218, 221, 19), width: 2),
              ),
              label: const Text(
                "Product Image",
                style: TextStyle(
                  color: Color.fromARGB(255, 52, 2, 2),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return "Enter product image";
              } else {
                return null;
              }
            },
          ),
          const SizedBox(
            height: 12,
          ),
          TextFormField(
            controller: _codeTEcontroller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              fillColor: const Color.fromARGB(255, 144, 140, 140),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                    color: Color.fromARGB(255, 218, 221, 19), width: 2),
              ),
              label: const Text(
                "Product Code",
                style: TextStyle(
                  color: Color.fromARGB(255, 52, 2, 2),
                  fontWeight: FontWeight.w400,
                ),
              ),
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
            visible: _AddNewProductInProgress == false,
            replacement: const Center(
              child: CircularProgressIndicator(),
            ),
            child: SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    _addNewProduct();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProductListScreen()));
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 18, 56, 60),
                ),
                child: const Text(
                  "Add",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _addNewProduct() async {
    _AddNewProductInProgress = true;
    setState(() {});
    Uri uri = Uri.parse("https://crud.teamrabbil.com/api/v1/CreateProduct");

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
    _AddNewProductInProgress = false;
    setState(() {});

    if (response.statusCode == 200) {
      _clearTextField();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("New item added"),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Add failed"),
        ),
      );
    }
  }

  void _clearTextField() {
    _nameTEcontroller.clear();
    _codeTEcontroller.clear();
    _priceTEcontroller.clear();
    _totalPriceTEcontroller.clear();
    _imageTEcontroller.clear();
    _quantityTEcontroller.clear();
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
