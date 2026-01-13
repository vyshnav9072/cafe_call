import 'package:cafe_call_app/screens/user/user_profile_page%20.dart';
import 'package:flutter/material.dart';

import 'package:cafe_call_app/screens/user/track_order_screen.dart';

import 'cart_page.dart';
import 'food_menu_dashboard_screen.dart';
import 'order_history_page.dart';

class EmptyTrackingPage extends StatelessWidget {
  const EmptyTrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Track Order"),
        leading: const BackButton(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 160,
            width: 160,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red.withOpacity(0.15),
            ),
            child: const Icon(
              Icons.delivery_dining,
              color: Colors.red,
              size: 70,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            "No Live Orders Yet",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              "Hungry? Browse our menu and get your favorite office snacks delivered in minutes.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white54),
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const FoodMenuDashboardScreen(),
                  ),
                );
              },
              child: const Text("Order Now"),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _bottomBar(context),
    );
  }

  Widget _bottomBar(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.white54,
      currentIndex: 2, // Track selected
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        Widget page;

        switch (index) {
          case 0:
            page = const FoodMenuDashboardScreen();
            break;
          case 1:
            page = const ShoppingCartScreen();
            break;
          case 2:
            page = const TrackOrderScreen();
            break;
          case 3:
            page = const OrderHistoryPage();
            break;
          case 4:
            page = const UserProfileSettingsPage();
            break;
          default:
            return;
        }

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => page),
        );
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: "Cart",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.location_on),
          label: "Track",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: "History",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Profile",
        ),
      ],
    );
  }
}
