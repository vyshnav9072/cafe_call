import 'package:cafe_call_app/screens/food_menu_dashboard_screen.dart';
import 'package:flutter/material.dart';

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
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FoodMenuDashboardScreen(),
              ),
            );
          },
          child: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        title: const Text(
          "Your Shopping Cart",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _cartItem(
              image:
                  "https://images.unsplash.com/photo-1550547660-d9450f859349",
              title: "Double Wag...",
              subtitle: "Extra cheese, No onion",
              price: 18.00,
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

            /// Special Instructions
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

            /// Price Summary
            _priceRow("Subtotal", "\$24.50"),
            _priceRow("Delivery Fee", "\$2.00"),
            _priceRow("Tax & Services", "\$1.50"),
            const Divider(color: Colors.grey),
            _priceRow("Total", "\$28.00", isTotal: true),
          ],
        ),
      ),

      /// Bottom Checkout Bar
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(color: Color(0xFF120A0A)),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Text(
                "CHECKOUT\n\$28.00",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Container(
                height: 52,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Center(
                  child: Text(
                    "Confirm Order  ➜",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

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
                  "\$${price.toStringAsFixed(2)}",
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
