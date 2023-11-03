import 'package:flutter/material.dart';

class AddNewProductScreen extends StatefulWidget {
  const AddNewProductScreen({super.key});

  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}
final TextEditingController _titleTEController = TextEditingController();
final TextEditingController _quantityTEController = TextEditingController();
final TextEditingController _productCodeTEController = TextEditingController();
final TextEditingController _priceTEController = TextEditingController();
final TextEditingController _totalPriceTEController = TextEditingController();
final TextEditingController _descriptionTEController =TextEditingController();

class _AddNewProductScreenState extends State<AddNewProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Product"),
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: _titleTEController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  label: Text("Title"),
                  hintText: "Enter product title",
                ),
              ),
              TextFormField(
                controller: _quantityTEController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  label: Text("Quantity"),
                  hintText: "Enter product quantity",
                ),
              ),
              TextFormField(
                controller: _productCodeTEController,
                // keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  label: Text("Product Code"),
                  hintText: "Enter your product code"
                ),
              ),
              TextFormField(
                controller: _priceTEController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  label: Text("Price"),
                  hintText: "Enter product price"
                ),
              ),
              TextFormField(
                controller: _totalPriceTEController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  label: Text("Total Price"),
                  hintText: "Enter total price"
                ),
              ),
              TextFormField(
                controller: _descriptionTEController,
                // maxLength: 2,
                maxLines: 3,
                decoration: const InputDecoration(
                  label: Text("Description"),
                  hintText: "Enter product description"
                ),
              ),
            SizedBox(height: 20,),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal:60)


                  ),
                  onPressed: (){}, child:Text("ADD")),
            ],
          ),
        ),
      )
    );
  }
  @override
  void dispose() {
   _titleTEController.dispose();
   _quantityTEController.dispose();
   _productCodeTEController.dispose();
   _priceTEController.dispose();
   _totalPriceTEController.dispose();
   _descriptionTEController.dispose();
    super.dispose();
  }

}
