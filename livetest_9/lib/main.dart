import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SizeSelector(),
    );
  }
}

class SizeSelector extends StatefulWidget {
  @override
  _SizeSelectorState createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {
  String _selectedSize = 'S';

  void _selectSize(String size) {
    setState(() {
      _selectedSize = size;
    });

    // Show a Snackbar with the selected size text
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Selected size: $_selectedSize'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Size Selector'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Size buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSizeButton('S'),
                _buildSizeButton('M'),
                _buildSizeButton('L'),
                _buildSizeButton('XL'),
                _buildSizeButton('XXL'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSizeButton(String size) {
    return ElevatedButton(
      onPressed: () => _selectSize(size),
      child: Text(size),
      style: ElevatedButton.styleFrom(
        primary: _selectedSize == size
            ? Colors.orangeAccent
            : Colors.white,
        onPrimary: _selectedSize == size
            ? Colors.white
            : Colors.black,
      ),
    );
  }
}