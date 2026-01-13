import 'package:flutter/material.dart';

import 'food_menu_dashboard_screen.dart';

class UserProfileSettingsPage extends StatelessWidget {
  const UserProfileSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0B0C),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading:   GestureDetector( onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodMenuDashboardScreen(),
            ),
          );
        },
            child: BackButton(color: Colors.white)),
        title: const Text(
          "Settings",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            /// PROFILE HEADER
            Row(
              children: [
                const CircleAvatar(
                  radius: 28,
                  backgroundImage: AssetImage("assets/profile.png"), // optional
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Akarsh K",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "+91 98765 43210",
                      style: TextStyle(color: Colors.white54, fontSize: 12),
                    ),
                  ],
                )
              ],
            ),

            const SizedBox(height: 20),

            /// PROMO CARD
            Container(
              height: 170,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  colors: [Color(0xFF2A1A16), Color(0xFF0F0B0A)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Hungry Now?",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 6),
                        const Text(
                          "Get your favorites delivered fast.",
                          style: TextStyle(color: Colors.white54),
                        ),
                        const SizedBox(height: 12),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text("Order Now"),
                        )
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.asset(
                      "assets/burger.png",
                      width: 110,
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// MENU LIST
            _menuTile(Icons.shopping_bag, "My Orders"),
            _menuTile(Icons.location_on, "Address Book"),
            _menuTile(Icons.favorite, "Favorite Foods"),
            _menuTile(Icons.credit_card, "Payments & Refunds"),

            const Spacer(),

            /// LOGOUT BUTTON
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
                side: const BorderSide(color: Colors.red),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {},
              icon: const Icon(Icons.logout, color: Colors.red),
              label: const Text(
                "Logout",
                style: TextStyle(color: Colors.red),
              ),
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _menuTile(IconData icon, String title) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
      leading: CircleAvatar(
        radius: 18,
        backgroundColor: const Color(0xFF1A1A1A),
        child: Icon(icon, color: Colors.red, size: 18),
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white38),
      onTap: () {},
    );
  }
}
