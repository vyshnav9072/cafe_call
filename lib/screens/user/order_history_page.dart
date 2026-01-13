import 'package:flutter/material.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({super.key});

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  bool isSearching = false;
  final TextEditingController searchController = TextEditingController();

  final List<Map<String, String>> orders = [
    {
      "date": "Oct 24, 10:15 AM",
      "title": "Indian Masala Dosa, Blueberry Muffin",
      "total": "\$18.50",
    },
    {
      "date": "Oct 20, 08:30 PM",
      "title": "Cheese Burger, Cold Coffee",
      "total": "\$22.00",
    },
    {
      "date": "Oct 18, 01:45 PM",
      "title": "Italian Pizza",
      "total": "\$15.00",
    },
    {
      "date": "Oct 15, 09:00 AM",
      "title": "Masala Noodles, Tea",
      "total": "\$12.50",
    },
  ];

  List<Map<String, String>> filteredOrders = [];

  @override
  void initState() {
    super.initState();
    filteredOrders = orders;
  }

  void _searchOrders(String query) {
    setState(() {
      filteredOrders = orders
          .where((order) =>
          order["title"]!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12090C),

      // 🔹 APP BAR WITH SEARCH
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.white),

        title: isSearching
            ? TextField(
          controller: searchController,
          autofocus: true,
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            hintText: "Search orders...",
            hintStyle: TextStyle(color: Colors.white54),
            border: InputBorder.none,
          ),
          onChanged: _searchOrders,
        )
            : const Text(
          "Order History",
          style: TextStyle(color: Colors.white),
        ),

        actions: [
          IconButton(
            icon: Icon(
              isSearching ? Icons.close : Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                if (isSearching) {
                  searchController.clear();
                  filteredOrders = orders;
                }
                isSearching = !isSearching;
              });
            },
          )
        ],
      ),

      // 🔹 BODY
      body: filteredOrders.isEmpty
          ? const Center(
        child: Text(
          "No orders found",
          style: TextStyle(color: Colors.white54),
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: filteredOrders.length,
        itemBuilder: (context, index) {
          final order = filteredOrders[index];
          return _orderCard(
            date: order["date"]!,
            title: order["title"]!,
            total: order["total"]!,
          );
        },
      ),
    );
  }

  // 🔹 ORDER CARD
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
              Text(
                "SUCCESS",
                style: TextStyle(color: Colors.green, fontSize: 12),
              ),
              Icon(Icons.receipt_long, color: Colors.white54),
            ],
          ),
          const SizedBox(height: 8),
          Text(date, style: const TextStyle(color: Colors.white)),
          const SizedBox(height: 6),
          Text(title, style: const TextStyle(color: Colors.white54)),
          const SizedBox(height: 6),
          Text("Total: $total",
              style: const TextStyle(color: Colors.white)),
          const SizedBox(height: 12),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              minimumSize: const Size(double.infinity, 42),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            onPressed: () {},
            child: const Text("Reorder"),
          )
        ],
      ),
    );
  }
}
