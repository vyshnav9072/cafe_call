

import 'package:cafe_call_app/invoice_biling_reports.dart';
import 'package:cafe_call_app/screens/admin/admin_profile_history.dart';
import 'package:cafe_call_app/screens/user/cart_page.dart';
import 'package:cafe_call_app/screens/user/premium_login_screen.dart';
import 'package:cafe_call_app/screens/user/product_detail_page.dart';
import 'package:cafe_call_app/screens/user/splash_screen.dart';
import 'package:cafe_call_app/screens/user/support_ticket_page.dart';
import 'package:cafe_call_app/screens/user/track_order_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWid

get {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body:AdminProfileHistory()),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
