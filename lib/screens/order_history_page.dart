import 'package:flutter/material.dart';

class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12090C),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Order History"),
        leading: const BackButton(),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search))
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 4,
        itemBuilder: (context, index) {
          return _orderCard(
            date: "Oct 24, 10:15 AM",
            title: "Indian Masala Dosa, Blueberry Muffin",
            total: "\$18.50",
          );
        },
      ),
      bottomNavigationBar: _bottomBar(),
    );
  }

  Widget _orderCard({
    required String date,
    required String title,
    required String total,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1D0F14),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("SUCCESS", style: TextStyle(color: Colors.green, fontSize: 12)),
              Icon(Icons.receipt, color: Colors.white54),
            ],
          ),
          const SizedBox(height: 8),
          Text(date, style: const TextStyle(color: Colors.white)),
          const SizedBox(height: 6),
          Text(title, style: const TextStyle(color: Colors.white54)),
          const SizedBox(height: 6),
          Text("Total: $total", style: const TextStyle(color: Colors.white)),
          const SizedBox(height: 12),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              minimumSize: const Size(double.infinity, 42),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            ),
            onPressed: () {},
            child: const Text("Reorder"),
          )
        ],
      ),
    );
  }

  Widget _bottomBar() {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFF12090C),
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.white54,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.restaurant), label: "Menu"),
        BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: "Orders"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],
    );
  }
}
