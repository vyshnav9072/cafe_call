import 'package:flutter/material.dart';

class InvoiceDetailsPage extends StatelessWidget {
  const InvoiceDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F1F1A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Invoice Details"),
        leading: const BackButton(),
      ),
      body: Column(
        children: [
          Container(
            height: 180,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/cafe.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Emerald Mall Cafe",
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  const Text("Order #EMC-88291 • Oct 24, 2023",
                      style: TextStyle(color: Colors.white54)),
                  const SizedBox(height: 16),

                  _item("Avocado Sourdough Toast x1", "\$12.00"),
                  _item("Iced Oat Latte x1", "\$6.50"),
                  _item("Protein Cookie x1", "\$3.50"),

                  const Divider(color: Colors.white24),
                  _item("Subtotal", "\$22.00"),
                  _item("Taxes", "\$1.80"),
                  _item("Company Reward Discount", "-\$5.00", isDiscount: true),

                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Total Amount", style: TextStyle(color: Colors.white, fontSize: 16)),
                      Text("\$18.80",
                          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                    ],
                  ),

                  const Spacer(),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                    ),
                    onPressed: () {},
                    child: const Text("Download PDF"),
                  ),
                  const SizedBox(height: 12),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      side: const BorderSide(color: Colors.red),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                    ),
                    onPressed: () {},
                    child: const Text("Share Invoice", style: TextStyle(color: Colors.red)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _item(String title, String price, {bool isDiscount = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.white54)),
          Text(
            price,
            style: TextStyle(
              color: isDiscount ? Colors.red : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
