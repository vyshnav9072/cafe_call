import 'package:cafe_call_app/screens/admin/admin_dashboard_screeen.dart';
import 'package:cafe_call_app/screens/food_menu_dashboard_screen.dart';
import 'package:cafe_call_app/screens/Invoice_details_page.dart';
import 'package:cafe_call_app/screens/cart_page.dart';
import 'package:cafe_call_app/screens/otp_verification_screen.dart';
import 'package:cafe_call_app/screens/premium_login_screen.dart';
import 'package:cafe_call_app/screens/product_detail_page.dart';
import 'package:cafe_call_app/screens/rewards_screen.dart';
import 'package:cafe_call_app/screens/track_order_screen.dart';
import 'package:cafe_call_app/screens/user_profile_page .dart';
import 'package:cafe_call_app/screens/splash_screen.dart';
import 'package:cafe_call_app/screens/support_ticket_page.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: AdminDashboardScreeen()),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
