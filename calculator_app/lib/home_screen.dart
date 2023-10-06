import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _fieldOneTEController = TextEditingController();
  final TextEditingController _fieldTwoTEController = TextEditingController();
  double result = 0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Calculator",
          style: TextStyle(
              fontSize: 18,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _fieldOneTEController,
                // keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(hintText: "Field 1"),
                validator: (String? value) {
                  if (value?.isEmpty ?? true) {
                    return "Enter Valid Value";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _fieldTwoTEController,
                // keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(hintText: "Field 2"),
                validator: (String? value) {
                  if (value?.isEmpty ?? true) {
                    return "Enter Valid Value";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        double firstNumber =
                            double.parse(_fieldOneTEController.text.trim());
                        double secondNumber =
                            double.parse(_fieldTwoTEController.text.trim());
                        // print(firstNumber);
                        // print(secondNumber);
                        result = firstNumber + secondNumber;
                        setState(() {});
                      }
                    },
                    icon: const Icon(Icons.add),
                    label: const Text("Add"),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        double firstNumber =
                            parseToDouble(_fieldOneTEController.text.trim());
                        double secondNumber =
                            parseToDouble(_fieldTwoTEController.text.trim());
                        // print(firstNumber);
                        // print(secondNumber);
                        result = firstNumber - secondNumber;
                        setState(() {});
                      }
                    },
                    icon: const Icon(Icons.remove),
                    label: const Text("Sub"),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        double firstNumber =
                            parseToDouble(_fieldOneTEController.text.trim());
                        double secondNumber =
                            parseToDouble(_fieldTwoTEController.text.trim());
                        // print(firstNumber);
                        // print(secondNumber);
                        result = firstNumber * secondNumber;
                        setState(() {});
                      }
                    },
                    icon: const Icon(Icons.close),
                    label: const Text("Mul"),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        double firstNumber =
                        parseToDouble(_fieldOneTEController.text.trim());
                        double secondNumber =
                        parseToDouble(_fieldTwoTEController.text.trim());
                        result = firstNumber / secondNumber;
                        setState(() {});
                      }
                    },
                    icon: const Icon(Icons.percent),
                    label: const Text("Mod"),
                  ),
                ],
              ),
              Text(
                'Result is : $result',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }

  double parseToDouble(String text) {
    return double.tryParse(text) ?? 0;
  }

  double addition(double firstNum, secondNum) {
    return firstNum + secondNum;
  }

  double subtraction(double firstNum, secondNum) {
    return firstNum - secondNum;
  }

  double multiplication(double firstNum, secondNum) {
    return firstNum * secondNum;
  }
}
