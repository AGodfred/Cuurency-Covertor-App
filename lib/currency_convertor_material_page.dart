import 'package:flutter/material.dart';

class CurrencyConvertorMaterialPage extends StatefulWidget {
  const CurrencyConvertorMaterialPage({super.key});

  @override
  State<CurrencyConvertorMaterialPage> createState() =>
      _CurrencyConvertorMaterialPage();
}

class _CurrencyConvertorMaterialPage
    extends State<CurrencyConvertorMaterialPage> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  void convert () {
    setState(() {
      result = double.parse(textEditingController.text) * 16.10;
    });
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        color: Colors.black,
        width: 2,
        strokeAlign: BorderSide.strokeAlignOutside,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          'Currency Convertor',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text on screen
              Text(
                'GHC ${result.toStringAsFixed(2)}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 55,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 20),
              // TextFied for input
              TextField(
                controller: textEditingController,
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'Enter currency in GHS',
                  hintStyle: TextStyle(color: Colors.black),
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.monetization_on),
                  focusedBorder: border,
                  enabledBorder: border,
                ),
              ),

              SizedBox(height: 15),

              // Text button
              TextButton(
                onPressed: convert, //void function,
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text('Convert', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
