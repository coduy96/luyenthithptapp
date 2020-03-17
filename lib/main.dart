import 'package:flutter/material.dart';
import 'package:luyenthithpt/pages/home_page.dart';

void main () {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child: HomePage(),
      ),
    );
  }
}