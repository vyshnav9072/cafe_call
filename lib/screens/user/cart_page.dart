import 'package:cafe_call_app/screens/user/support_ticket_page.dart';
import 'package:cafe_call_app/screens/user/user_profile_page%20.dart';
import 'package:flutter/material.dart';

import 'food_menu_dashboard_screen.dart';
import 'cart_page.dart';
import 'track_order_screen.dart';
import 'order_history_page.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({super.key});

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  int burgerQty = 1;
  int friesQty = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0A0A),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const FoodMenuDashboardScreen(),
              ),
            );
          },
        ),
        title: const Text(
          "Your Shopping Cart",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),

      /// 🔻 BODY (Scrollable)
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _cartItem(
                image:
                    "https://images.unsplash.com/photo-1550547660-d9450f859349",
                title: "Double Wag...",
                subtitle: "Extra cheese, No onion",
                price: 35.00,
                quantity: burgerQty,
                onAdd: () => setState(() => burgerQty++),
                onRemove: () {
                  if (burgerQty > 1) {
                    setState(() => burgerQty--);
                  }
                },
              ),

              const SizedBox(height: 14),

              _cartItem(
                image:
                    "https://images.unsplash.com/photo-1630384060421-cb20d0e0649d",
                title: "Truffle Fries",
                subtitle: "Side order",
                price: 6.50,
                quantity: friesQty,
                onAdd: () => setState(() => friesQty++),
                onRemove: () {
                  if (friesQty > 1) {
                    setState(() => friesQty--);
                  }
                },
              ),

              const SizedBox(height: 18),

              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFF1C1414),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const TextField(
                  maxLines: 3,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText:
                        "Add a note (e.g. no onions, extra sauce, delivery gate code)...",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),
              _priceRow("Subtotal", "97."),
              _priceRow("Delivery Fee", "2.00"),
              _priceRow("Tax & Services", "1.50"),
              const Divider(color: Colors.grey),
              _priceRow("Total", "100.00", isTotal: true),

              /// space for bottom bar
              const SizedBox(height: 120),
            ],
          ),
        ),
      ),

      /// 🔻 CHECKOUT + BOTTOM NAV
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// 🔥 Checkout Pill Bar
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: Color(0xFF120A0A),
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => TrackOrderScreen()),
                );
              },
              child: Container(
                height: 56,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red.withOpacity(0.35),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    /// LEFT – Checkout Amount
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "CHECKOUT",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 11,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          "₹100.00",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const Spacer(),

                    /// RIGHT – Confirm Order
                    const Text(
                      "Confirm Order",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),
          ),

          /// 🔽 Bottom Navigation (unchanged)
          BottomNavigationBar(
            backgroundColor: Colors.black,
            selectedItemColor: Colors.red,
            unselectedItemColor: Colors.white54,
            currentIndex: 1,
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
                default:
                  return;
              }

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => page),
              );
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: "Cart"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.location_on), label: "Track"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.history), label: "History"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.support_agent), label: "Support"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Profile"),
            ],
          ),
        ],
      ),

    );
  }

  // ------------------ HELPERS ------------------

  Widget _cartItem({
    required String image,
    required String title,
    required String subtitle,
    required double price,
    required int quantity,
    required VoidCallback onAdd,
    required VoidCallback onRemove,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1414),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          CircleAvatar(radius: 28, backgroundImage: NetworkImage(image)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
                const SizedBox(height: 6),
                Text(
                  "${price.toStringAsFixed(2)}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              _qtyButton("-", onRemove),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "$quantity",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              _qtyButton("+", onAdd),
            ],
          ),
        ],
      ),
    );
  }

  Widget _qtyButton(String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 14,
        backgroundColor: Colors.red,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _priceRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
