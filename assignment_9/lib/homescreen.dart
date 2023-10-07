import 'package:flutter/material.dart';
import 'product.dart';

enum SampleItem { itemOne }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SampleItem? selectedMenu;
  final List<Product> _products = [
    Product(
      image: "images/photo1.jpg",
      name: "Pullover",
      color: "White",
      size: "xl",
      price: 50,
    ),
    Product(
      image: "images/photo2.jpg",
      name: "T-Shir",
      color: "White",
      size: "xl",
      price: 37,
    ),
    Product(
      image: "images/photo3.jpg",
      name: "Sport Dress",
      color: "Black",
      size: "xl",
      price: 38,
    ),
  ];
  int _totalAmount = 0;
  @override
  void initState() {
    _totalAmount = _products
        .map((e) => e.price)
        .reduce((value, element) => value + element);
    super.initState();
  }

  void _showSnackBar(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextField(
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
              Text(
                "My Bag",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _products.length,
                  itemBuilder: (context, index) => Card(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    elevation: 1,
                    child: Row(
                      children: [
                        Image.asset(
                          _products[index].image,
                          width: width < 300 ? 70 : 115,
                          height: width < 300 ? 70 : 115,
                          fit: BoxFit.fill,
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          _products[index].name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium,
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            text: 'Color: ',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall,
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: _products[index].color,
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                              const TextSpan(text: ' Size: '),
                                              TextSpan(
                                                text: _products[index].size,
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    PopupMenuButton<SampleItem>(
                                      color: Colors.grey,
                                      initialValue: selectedMenu,
                                      // Callback that sets the selected popup menu item.
                                      onSelected: (SampleItem item) {
                                        setState(() {
                                          selectedMenu = item;
                                        });
                                      },
                                      itemBuilder: (BuildContext context) =>
                                      <PopupMenuEntry<SampleItem>>[
                                        const PopupMenuItem<SampleItem>(
                                          value: SampleItem.itemOne,
                                          child: Text('Delete'),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: width < 300
                                      ? 0
                                      : width > 700
                                      ? 25
                                      : 15,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            if (_products[index].quantity > 0) {
                                              setState(() {
                                                _products[index].quantity--;
                                                _totalAmount -=
                                                    _products[index].price;
                                              });
                                            }
                                          },
                                          child: Text(
                                            "-",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "${_products[index].quantity}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              _products[index].quantity++;
                                              _totalAmount +=
                                                  _products[index].price;
                                            });
                                          },
                                          child: Text(
                                            "+",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: width < 300 ? 10 : 16),
                                      child: Text(
                                        "${_products[index].price}\$",
                                        style: TextStyle(
                                          fontSize: width < 300 ? 12 : 15,
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total amount:",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          "$_totalAmount\$",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_totalAmount == 0) {
                            _showSnackBar("You need to add product!!");
                          } else {
                            _showSnackBar("Thank you for purchase");
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                          backgroundColor: const Color(0XFFDB3022),
                          foregroundColor: Colors.white,
                        ),
                        child: const Text("CHECK OUT"),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}