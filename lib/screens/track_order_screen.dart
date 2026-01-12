import 'package:flutter/material.dart';

import 'food_menu_dashboard_screen.dart';
// import other screens as needed
// import 'shopping_cart_screen.dart';
// import 'user_profile_settings_page.dart';

class TrackOrderScreen extends StatefulWidget {
  const TrackOrderScreen({super.key});

  @override
  State<TrackOrderScreen> createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {
  int selectedBottomIndex = 2; // Track tab active

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0A0A),

      /// AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const FoodMenuDashboardScreen(),
              ),
            );
          },
          child: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        title: const Text(
          "Track Order",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),

      /// Body
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// Circle Icon
          Container(
            width: 180,
            height: 180,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  Colors.red.withOpacity(0.35),
                  Colors.transparent,
                ],
              ),
            ),
            child: Center(
              child: Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.delivery_dining,
                  color: Colors.red,
                  size: 48,
                ),
              ),
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

          const SizedBox(height: 10),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              "Hungry? Browse our menu and get your favorite office snacks delivered in minutes.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ),

          const SizedBox(height: 40),

          /// Order Now Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const FoodMenuDashboardScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "Order Now",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

      /// Custom Bottom Navigation
      bottomNavigationBar: _bottomNav(),
    );
  }

  /// 🔹 Bottom Navigation (Custom)
  Widget _bottomNav() {
    return Container(
      height: 78,
      decoration: const BoxDecoration(
        color: Color(0xFF111111),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _navItem(
            icon: Icons.home,
            label: 'Home',
            index: 0,
            onTap: () {
              setState(() => selectedBottomIndex = 0);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => const FoodMenuDashboardScreen(),
                ),
              );
            },
          ),
          _navItem(
            icon: Icons.shopping_cart,
            label: 'Cart',
            index: 1,
            onTap: () {
              setState(() => selectedBottomIndex = 1);
              // Navigator.push(context,
              //   MaterialPageRoute(builder: (_) => const ShoppingCartScreen()));
            },
          ),
          _navItem(
            icon: Icons.location_on,
            label: 'Track',
            index: 2,
            onTap: () {
              setState(() => selectedBottomIndex = 2);
            },
          ),
          _navItem(
            icon: Icons.person,
            label: 'Profile',
            index: 3,
            onTap: () {
              setState(() => selectedBottomIndex = 3);
              // Navigator.push(context,
              //   MaterialPageRoute(builder: (_) => const UserProfileSettingsPage()));
            },
          ),
        ],
      ),
    );
  }

  Widget _navItem({
    required IconData icon,
    required String label,
    required int index,
    required VoidCallback onTap,
  }) {
    final bool isActive = selectedBottomIndex == index;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isActive ? Colors.red : Colors.grey,
            size: 22,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isActive ? Colors.red : Colors.grey,
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
