import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class OrderManagementList extends StatefulWidget {
  const OrderManagementList({super.key});

  @override
  State<OrderManagementList> createState() => _OrderManagementListState();
}

class _OrderManagementListState extends State<OrderManagementList> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F1218),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Orders",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Manage your active bookings",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      _icon(Icons.search),
                      const SizedBox(width: 10),
                      _icon(Icons.notifications),
                    ],
                  )
                ],
              ),

              const SizedBox(height: 20),

              /// TABS
              Row(
                children: [
                  _tab("All", 0),
                  _tab("Pending", 1),
                  _tab("Completed", 2),
                ],
              ),

              const SizedBox(height: 20),

              /// ORDER LIST
              Expanded(
                child: ListView(
                  children: [
                    _liveOrderCard(),
                    const SizedBox(height: 16),
                    _pendingOrderCard(),
                    const SizedBox(height: 16),
                    _cancelledOrderCard(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// ================= WIDGETS =================

  Widget _icon(IconData icon) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: const Color(0xFF1E222B),
      child: Icon(icon, color: Colors.white),
    );
  }

  Widget _tab(String title, int index) {
    final bool selected = selectedTab == index;
    return GestureDetector(
      onTap: () => setState(() => selectedTab = index),
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? Colors.cyan : const Color(0xFF1E222B),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: selected ? Colors.black : Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  /// ================= ORDER CARDS =================

  Widget _liveOrderCard() {
    return _card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _status("LIVE NOW", Colors.cyan, "\$45.00"),
          const SizedBox(height: 10),
          _title("Order #8821", "Today, 12:45 PM"),
          const SizedBox(height: 10),
          _item("2x", "Truffle Beef Burger"),
          _item("1x", "Parmesan Truffle Fries"),
          const SizedBox(height: 16),
          const Text(
            "DELIVERY STATUS",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          const SizedBox(height: 10),
          _progress(),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(Icons.apple, color: Colors.white, size: 18),
                  SizedBox(width: 6),
                  Text("Apple Pay", style: TextStyle(color: Colors.grey)),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {},
                child: const Text("Manage Order"),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _pendingOrderCard() {
    return _card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _status("PENDING APPROVAL", Colors.orange, "\$32.50"),
          const SizedBox(height: 10),
          _title("Order #8820", "Today, 1:05 PM"),
          const SizedBox(height: 10),
          _item("1x", "Margherita Pizza XL"),
          _item("2x", "Coca Cola Zero"),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text("Confirm Order"),
                ),
              ),
              const SizedBox(width: 12),
              TextButton(
                onPressed: () {},
                child: const Text("Reject",
                    style: TextStyle(color: Colors.grey)),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _cancelledOrderCard() {
    return _card(
      color: const Color(0xFF1A1212),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _status("CANCELLED", Colors.red, "\$18.00"),
          const SizedBox(height: 10),
          _title("Order #8819", "Today, 11:20 AM"),
          const SizedBox(height: 10),
          _item("1x", "Vegan Poke Bowl"),
          const SizedBox(height: 10),
          const Text(
            "Reason: Customer changed their mind",
            style: TextStyle(color: Colors.redAccent, fontSize: 12),
          ),
        ],
      ),
    );
  }

  /// ================= HELPERS =================

  Widget _card({required Widget child, Color? color}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color ?? const Color(0xFF1E222B),
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }

  Widget _status(String text, Color color, String price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,
            style: TextStyle(
                color: color, fontWeight: FontWeight.bold, fontSize: 12)),
        Text(price,
            style:
            TextStyle(color: color, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _title(String title, String time) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(time, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget _item(String qty, String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(qty, style: const TextStyle(color: Colors.grey)),
          const SizedBox(width: 10),
          Text(name, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Widget _progress() {
    return Row(
      children: [
        _step(true),
        _line(),
        _step(true),
        _line(),
        _step(false),
        _line(),
        _step(false),
      ],
    );
  }

  Widget _step(bool done) {
    return CircleAvatar(
      radius: 10,
      backgroundColor: done ? Colors.cyan : Colors.grey.shade700,
      child: done
          ? const Icon(Icons.check, size: 12, color: Colors.black)
          : null,
    );
  }

  Widget _line() {
    return Expanded(
      child: Container(height: 2, color: Colors.grey.shade700),
    );
  }
}

