import 'package:cafe_call_app/screens/user_profile_page%20.dart';
import 'package:flutter/material.dart';

import 'cart_page.dart';
import 'track_order_screen.dart';


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
      'price': '₹100',
      'image': 'assets/images/burger2.png',
    },
    {
      'name': 'Italian Pizza',
      'desc': 'Cheese & Tomato',
      'price': '₹199',
      'image': 'assets/images/pizza.png',
    },
    {
      'name': 'Masala Noodles',
      'desc': 'Spicy & Hot',
      'price': '₹89',
      'image': 'assets/images/close-up-view-masala-maggi-noodles-served-bowl-instant-spicy-ramen-noodles-fresh-green-onion-red-peppers-herbs-food-386925216.webp',
    },
    {
      'name': 'Cold Coffee',
      'desc': 'Creamy & Smooth',
      'price': '₹100',
      'image': 'assets/images/coffee.png',
    },
    {
      'name': 'Chocolate Shake',
      'desc': 'With Nuts',
      'price': '₹99',
      'image': 'assets/images/img.png',
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

  /// 🔹 TOP HEADER
  Widget _topHeader() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Deliver to',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            SizedBox(height: 4),
            Text(
              'Home, Downtown',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Spacer(),
        _circleIcon(Icons.search),
        SizedBox(width: 12),
         CircleAvatar(
          radius: 18,
          backgroundImage: AssetImage('assets/images/unnamed.jpg'),
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
                  child: Image.asset(
                    item['image']!,
                    fit: BoxFit.contain,
                  ),
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
            onTap: () => setState(() => selectedBottomIndex = 0),
          ),
          _navItem(
            icon: Icons.shopping_cart,
            label: 'Cart',
            index: 1,
            onTap: () {
              setState(() => selectedBottomIndex = 1);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ShoppingCartScreen()),
              );
            },
          ),
          _navItem(
            icon: Icons.location_on,
            label: 'Track',
            index: 2,
            onTap: () {
              setState(() => selectedBottomIndex = 2);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const TrackOrderScreen()),
              );
            },
          ),
          _navItem(
            icon: Icons.person,
            label: 'Profile',
            index: 3,
            onTap: () {
              setState(() => selectedBottomIndex = 3);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const UserProfileSettingsPage(),
                ),
              );
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
          Icon(icon, color: isActive ? Colors.red : Colors.grey),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isActive ? Colors.red : Colors.grey,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }

  /// 🔹 CIRCLE ICON
  Widget _circleIcon(IconData icon) {
    return Container(
      height: 36,
      width: 36,
      decoration: const BoxDecoration(
        color: Color(0xFF1C1C1C),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white, size: 18),
    );
  }
}
