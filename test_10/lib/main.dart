import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SelectScreen(),
    );
  }
}

class SelectScreen extends StatefulWidget {
  @override
  _SelectScreenState createState() => _SelectScreenState();
}

class _SelectScreenState extends State<SelectScreen> {
  final List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
    'Item 8',
  ];

  List<String> selectedItems = [];

  void selected(bool isSelected, int index) {
    if (isSelected) {
      selectedItems.remove(items[index]);
    } else {
      selectedItems.add(items[index]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selection Screen '),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          bool isSelected = selectedItems.contains(items[index]);
          return ListTile(
            title: Text(items[index]),
            tileColor: isSelected ? Colors.blue : null,
            onTap: () {
              setState(() {
                selected(isSelected, index);
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Selected Items'),
                content:
                    Text('Number of selected items: ${selectedItems.length}'),
                actions: <Widget>[
                  TextButton(
                    child: const Text(
                      'Close',
                      style: TextStyle(color: Colors.blue),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
