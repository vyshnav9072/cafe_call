import 'package:cafe_call_app/screens/user/cart_page.dart';
import 'package:cafe_call_app/screens/user/food_menu_dashboard_screen.dart';
import 'package:cafe_call_app/screens/user/track_order_screen.dart';
import 'package:cafe_call_app/screens/user/user_profile_page%20.dart';
import 'package:flutter/material.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int currentIndex=0;
  List<Widget> screens=[FoodMenuDashboardScreen(),ShoppingCartScreen(),TrackOrderScreen(),UserProfileSettingsPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex] ,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          currentIndex=index;
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_sharp),label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_sharp),label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_sharp),label: ''),
        ],
      ),
    );
  }
}
