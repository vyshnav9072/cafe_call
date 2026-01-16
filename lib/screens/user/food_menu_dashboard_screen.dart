import 'package:cafe_call_app/screens/user/cart_page.dart';
import 'package:cafe_call_app/screens/user/user_profile_page%20.dart';
import 'package:flutter/material.dart';
import 'support_ticket_page.dart';
import 'track_order_screen.dart';

class FoodMenuDashboardScreen extends StatefulWidget {
  const FoodMenuDashboardScreen({super.key});

  @override
  State<FoodMenuDashboardScreen> createState() =>
      _FoodMenuDashboardScreenState();
}

class _FoodMenuDashboardScreenState extends State<FoodMenuDashboardScreen> {
  int selectedCategory = 0;

  final List<String> categories = ['All', 'Burgers', 'Pizzas', 'Drinks'];

  final List<Map<String, String>> items = [
    {
      'name': 'Coffee',
      'desc': '',
      'price': '15',
      'image': 'assets/images/pexels-photo-312418.webp',
    },
    {
      'name': ' Samoosa',
      'desc': '',
      'price': '12',
      'image': 'assets/images/1bdaca54b40441bc8a1bccc733e3ca43.jpg',
    },
    {
      'name': 'Tea',
      'desc': '',
      'price': '10',
      'image': 'assets/images/5cb88a02e013987379378009ba8d7eb2.jpg',
    },
    {
      'name': 'Butter Bun',
      'desc': '',
      'price': '30',
      'image': 'assets/images/ca126e6fba83b7f7f6f9199ef6d31b0d.jpg',
    },
    {
      'name': 'Avilmilk',
      'desc': '',
      'price': '35',
      'image': 'assets/images/e76ea37987f84a7c61000e05b2ae309d.jpg',
    },
    {
      'name': 'Romali rol',
      'desc': '',
      'price': '35',
      'image': 'assets/images/c4122e01fde5625b65ea2b9d2ecb6afd.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E0E0E),
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
                    fontWeight: FontWeight.bold),
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
        const Text('Home, Downtown',
            style: TextStyle(color: Colors.white, fontSize: 16)),
        const Spacer(),
        _circleIcon(
          icon: Icons.fmd_good_outlined,
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const TrackOrderScreen())),
        ),
        const SizedBox(width: 12),
        _circleIcon(
          icon: Icons.support_agent,
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SupportTicketPage())),
        ),
        const SizedBox(width: 12),
        GestureDetector(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>UserProfileSettingsPage()));},
          child: const CircleAvatar(
            radius: 18,
            backgroundImage: AssetImage('assets/images/unnamed.jpg'),
          ),
        ),
      ],
    );
  }

  Widget _circleIcon({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 36,
        width: 36,
        decoration: const BoxDecoration(
          color: Color(0xFF1C1C1C),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white),
      ),
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
          final isSelected = selectedCategory == index;
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
                    color: isSelected ? Colors.white : Colors.grey),
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
                child: Image.asset(item['image']!, fit: BoxFit.contain),
              ),
              const SizedBox(height: 8),
              Text(item['name']!,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              Text(item['desc']!,
                  style:
                  const TextStyle(color: Colors.grey, fontSize: 12)),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    '₹${item['price']}',
                    style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      _openItemBottomSheet(item);
                    },
                    child: const Icon(Icons.add_circle,
                        color: Colors.red),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  /// 🔥 BOTTOM SHEET (LIKE IMAGE)
  void _openItemBottomSheet(Map<String, String> item) {
    int qty = 0;
    int price = int.parse(item['price']!);

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.black,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// ITEM NAME
                  Text(
                    item['name']!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 16),

                  /// ITEM ROW
                  Row(
                    children: [
                      Image.asset(
                        item['image']!,
                        height: 50,
                        width: 50,
                      ),
                      const SizedBox(width: 12),

                      /// PRICE (RED)
                      Expanded(
                        child: Text(
                          '₹$price',
                          style: const TextStyle(
                            color: Colors.white, // 🔴 PRICE COLOR FIXED
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),

                      /// ADD / QTY BUTTON
                      qty == 0
                          ? ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        onPressed: () {
                          setModalState(() => qty = 1);
                        },
                        child: const Text(
                          'ADD',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                          : Row(
                        children: [
                          IconButton(
                            color: Colors.red,
                            onPressed: () {
                              setModalState(() => qty--);
                            },
                            icon: const Icon(Icons.remove_circle),
                          ),
                          Text(
                            '$qty',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            color: Colors.red,
                            onPressed: () {
                              setModalState(() => qty++);
                            },
                            icon: const Icon(Icons.add_circle),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// TOTAL + CONFIRM
                  GestureDetector(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ShoppingCartScreen()));},
                    child: Container(
                      width: double.infinity,
                      padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Item total : ₹${qty * price}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                           Spacer(),
                          GestureDetector(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ShoppingCartScreen()));},
                            child: Text(
                              'Confirm',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

}
