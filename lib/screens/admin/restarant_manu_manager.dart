import 'package:flutter/material.dart';

class RestarantManuManager extends StatefulWidget {
  const RestarantManuManager({super.key});

  @override
  State<RestarantManuManager> createState() => _RestarantManuManagerState();
}

class _RestarantManuManagerState extends State<RestarantManuManager> {
  int selectedCategory = 0;
  bool showOnlyActive = false;

  final List<String> categories = [
    'All',
    'Appetizers',
    'Main Course',
    'Dessert',
    'Sides',
  ];

  final List<MenuItem> menuItems = [
    MenuItem(
      name: 'Truffle Risotto',
      category: 'Main Course',
      price: 24.00,
      image:
      'https://images.unsplash.com/photo-1549931319-a545dcf3bc73',
      isActive: true,
    ),
    MenuItem(
      name: 'Wagyu Sliders',
      category: 'Appetizers',
      price: 18.50,
      image:
      'https://images.unsplash.com/photo-1550547660-d9450f859349',
      isActive: false,
    ),
    MenuItem(
      name: 'Matcha Fondant',
      category: 'Dessert',
      price: 12.00,
      image:
      'https://images.unsplash.com/photo-1550547660-d9450f859349',
      isActive: true,
    ),
    MenuItem(
      name: 'Artisan Sourdough',
      category: 'Sides',
      price: 6.00,
      image:
      'https://images.unsplash.com/photo-1549931319-a545dcf3bc73',
      isActive: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final filteredItems = menuItems.where((item) {
      final matchCategory = selectedCategory == 0 ||
          item.category == categories[selectedCategory];
      final matchActive = !showOnlyActive || item.isActive;
      return matchCategory && matchActive;
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFF121417),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121417),
        elevation: 0,
        centerTitle: true,
        leading: const Icon(Icons.arrow_back,color: Colors.white,),
        title: const Text(
          'Menu Manager',
          style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.search,color: Colors.white ,),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// CATEGORY TABS
          SizedBox(
            height: 44,
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final selected = selectedCategory == index;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(categories[index]),
                    selected: selected,
                    selectedColor: Colors.redAccent,
                    backgroundColor: const Color(0xFF1E2228),
                    labelStyle: TextStyle(
                      color: selected ? Colors.white : Colors.grey,
                    ),
                    onSelected: (_) {
                      setState(() => selectedCategory = index);
                    },
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 16),

          /// MENU GRID
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: filteredItems.length,
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) {
                return MenuCard(
                  item: filteredItems[index],
                  onToggle: () {
                    setState(() {
                      filteredItems[index].isActive =
                      !filteredItems[index].isActive;
                    });
                  },
                );
              },
            ),
          ),

          /// BOTTOM SWITCH
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Switch(
                  value: showOnlyActive,
                  activeColor: Colors.redAccent,
                  onChanged: (value) {
                    setState(() => showOnlyActive = value);
                  },
                ),
                const Text(
                  'Show only active items',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// ================= CARD =================

class MenuCard extends StatelessWidget {
  final MenuItem item;
  final VoidCallback onToggle;

  const MenuCard({
    super.key,
    required this.item,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E2228),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius:
            const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              item.image,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.category.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 11,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  '\$${item.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item.isActive ? 'ACTIVE' : 'INACTIVE',
                      style: TextStyle(
                        color:
                        item.isActive ? Colors.green : Colors.grey,
                        fontSize: 11,
                      ),
                    ),
                    Switch(
                      value: item.isActive,
                      activeColor: Colors.redAccent,
                      onChanged: (_) => onToggle(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// ================= MODEL =================

class MenuItem {
  final String name;
  final String category;
  final double price;
  final String image;
  bool isActive;

  MenuItem({
    required this.name,
    required this.category,
    required this.price,
    required this.image,
    this.isActive = true,
  });
}

