import 'package:btvn6_flutter/product_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your Product',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ProductList(),
      debugShowCheckedModeBanner: false,
    );
  }
}
