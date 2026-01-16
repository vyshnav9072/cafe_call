import 'package:flutter/material.dart';

class InventoryStockLevels extends StatefulWidget {
  const InventoryStockLevels({super.key});

  @override
  State<InventoryStockLevels> createState() => _InventoryStockLevelsState();
}

class _InventoryStockLevelsState extends State<InventoryStockLevels> {
  int selectedCategory = 0;

  final List<String> categories = [
    'All Items',
    'Produce',
    'Meat',
    'Dairy',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F1C1B),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F1C1B),
        elevation: 0,
        title: const Text(
          'Inventory',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.tune),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// CATEGORY FILTER
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final bool isSelected = selectedCategory == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() => selectedCategory = index);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFF1ED760)
                            : const Color(0xFF1A2E2B),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        categories[index],
                        style: TextStyle(
                          color:
                          isSelected ? Colors.black : Colors.grey.shade300,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 16),

            /// STOCK LIST
            Expanded(
              child: ListView(
                children: const [
                  StockItemCard(
                    image:
                    'https://images.unsplash.com/photo-1588345921523-c2dcdb7f1dcd',
                    category: 'SEAFOOD',
                    name: 'Salmon Fillets',
                    sku: 'SKU-SEA-102',
                    stockText: '12% • 45 kg',
                    progress: 0.12,
                    isLowStock: true,
                  ),
                  StockItemCard(
                    image:
                    'https://images.unsplash.com/photo-1567306226416-28f0efdc88ce',
                    category: 'PRODUCE',
                    name: 'Hass Avocados',
                    sku: 'SKU-PRO-210',
                    stockText: '80% • 12 crates',
                    progress: 0.8,
                    isLowStock: false,
                  ),
                  StockItemCard(
                    image:
                    'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b',
                    category: 'DAIRY',
                    name: 'Whole Milk',
                    sku: 'SKU-DAI-054',
                    stockText: '45% • 18 liters',
                    progress: 0.45,
                    isLowStock: false,
                  ),
                  StockItemCard(
                    image:
                    'https://images.unsplash.com/photo-1604908554026-6c73be29e4c8',
                    category: 'MEAT',
                    name: 'Ribeye Steak',
                    sku: 'SKU-MEA-998',
                    stockText: '8% • 6 kg',
                    progress: 0.08,
                    isLowStock: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StockItemCard extends StatelessWidget {
  final String image;
  final String category;
  final String name;
  final String sku;
  final String stockText;
  final double progress;
  final bool isLowStock;

  const StockItemCard({
    super.key,
    required this.image,
    required this.category,
    required this.name,
    required this.sku,
    required this.stockText,
    required this.progress,
    required this.isLowStock,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF142928),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// IMAGE
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              image,
              height: 140,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// CATEGORY & SKU
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      category,
                      style: const TextStyle(
                        color: Color(0xFF1ED760),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      sku,
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                /// ITEM NAME
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                /// CURRENT LEVEL
                Text(
                  'Current Level',
                  style: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  stockText,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 10),

                /// PROGRESS BAR
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 8,
                    backgroundColor: Colors.grey.shade800,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      isLowStock
                          ? Colors.orange
                          : const Color(0xFF1ED760),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                /// LOW STOCK + BUTTON
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (isLowStock)
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.orange.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'LOW STOCK',
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1ED760),
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text('Update Stock'),
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

