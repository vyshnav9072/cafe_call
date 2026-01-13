import 'package:cafe_call_app/screens/user/track_order_screen.dart';
import 'package:cafe_call_app/screens/user/user_profile_page%20.dart';
import 'package:flutter/material.dart';

import 'cart_page.dart';
import 'order_history_page.dart';

class FoodMenuDashboardScreen extends StatefulWidget {
  const FoodMenuDashboardScreen({super.key});

  @override
  State<FoodMenuDashboardScreen> createState() =>
      _FoodMenuDashboardScreenState();
}

class _FoodMenuDashboardScreenState extends State<FoodMenuDashboardScreen> {
  int selectedCategory = 0;
  int selectedBottomIndex = 0;

  final List<String> categories = ['All', 'Burgers', 'Pizzas', 'Drinks'];

  final List<Map<String, String>> items = [
    {
      'name': 'Classic Burger',
      'desc': 'Crispy Chicken',
      'price': '₹99',
      'image': 'assets/images/pexels-photo-312418.webp',
    },
    {
      'name': 'Cheese Burger',
      'desc': 'Extra Cheese',
      'price': '₹129',
      'image': 'assets/images/pexels-photo-312418.webp',
    },
    {
      'name': 'Italian Pizza',
      'desc': 'Cheese & Tomato',
      'price': '₹199',
      'image': 'assets/images/pizza.png',
    },
    {
      'name': 'Italian Pizza',
      'desc': 'Cheese & Tomato',
      'price': '₹199',
      'image': 'assets/images/pizza.png',
    },
    {
      'name': 'Italian Pizza',
      'desc': 'Cheese & Tomato',
      'price': '₹199',
      'image': 'assets/images/pizza.png',
    },
    {
      'name': 'Italian Pizza',
      'desc': 'Cheese & Tomato',
      'price': '₹199',
      'image': 'assets/images/pizza.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E0E0E),
      bottomNavigationBar: _bottomNav(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _topHeader(),
              const SizedBox(height: 20),
              _categories(),
              const SizedBox(height: 24),
              const Text(
                'Popular Items',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(child: _itemsGrid()),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔹 TOP HEADER WITH SEARCH FIELD
  Widget _topHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Deliver to',
          style: TextStyle(color: Colors.grey, fontSize: 12),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            const Text(
              'Home, Downtown',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const UserProfileSettingsPage(),
                  ),
                );
              },
              child: const CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage('assets/images/unnamed.jpg'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        /// 🔍 SEARCH BAR
        Container(
          height: 46,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            color: const Color(0xFF1C1C1C),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: const [
              Icon(Icons.search, color: Colors.grey),
              SizedBox(width: 10),
              Expanded(
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Search food, drinks...",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// 🔹 CATEGORIES
  Widget _categories() {
    return SizedBox(
      height: 42,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final bool isSelected = selectedCategory == index;
          return GestureDetector(
            onTap: () => setState(() => selectedCategory = index),
            child: Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected ? Colors.red : const Color(0xFF1C1C1C),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                categories[index],
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  /// 🔹 ITEMS GRID
  Widget _itemsGrid() {
    return GridView.builder(
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.72,
      ),
      itemBuilder: (context, index) {
        final item = items[index];
        return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFF161616),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Center(
                  child: Image.asset(item['image']!, fit: BoxFit.contain),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                item['name']!,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                item['desc']!,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    item['price']!,
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: 32,
                    width: 32,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.add,
                        color: Colors.white, size: 18),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  /// 🔹 BOTTOM NAVIGATION
  Widget _bottomNav() {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFF111111),
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.grey,
      currentIndex: selectedBottomIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        setState(() => selectedBottomIndex = index);

        switch (index) {
          case 1:
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const ShoppingCartScreen()));
            break;
          case 2:
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const TrackOrderScreen()));
            break;
          case 3:
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => OrderHistoryPage()));
            break;
          case 4:
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const UserProfileSettingsPage()));
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart), label: "Cart"),
        BottomNavigationBarItem(
            icon: Icon(Icons.location_on), label: "Track"),
        BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],
    );
  }
}
