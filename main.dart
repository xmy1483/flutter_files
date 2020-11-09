import 'package:flutter/material.dart';
import 'package:flutterapp1/coupon/CouponPage.dart';

import 'user/UserCenter.dart';
import 'cashcard/CashCardListPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CouponPage(),
    );
  }
}
