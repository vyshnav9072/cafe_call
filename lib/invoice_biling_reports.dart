import 'package:flutter/material.dart';

class InvoiceBilingReports extends StatefulWidget {
  const InvoiceBilingReports({super.key});

  @override
  State<InvoiceBilingReports> createState() => _InvoiceBilingReportsState();
}

class _InvoiceBilingReportsState extends State<InvoiceBilingReports> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F1115),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F1115),
        elevation: 0,
        leading: const Icon(Icons.arrow_back_ios, size: 18,color: Colors.white,),
        title: const Text(
          'Invoices & Billing',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,color: Colors.white),
        ),
        actions: const [
          Icon(Icons.search,color: Colors.white,),
          SizedBox(width: 12),
          Icon(Icons.tune,color: Colors.white,),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _monthlySummaryCard(),
            const SizedBox(height: 20),
            _statsRow(),
            const SizedBox(height: 24),
            _header(),
            const SizedBox(height: 12),
            _invoiceItem(
              invoice: 'INV-2024-001',
              date: 'Oct 24, 2023',
              amount: '\$142.50',
            ),
            _invoiceItem(
              invoice: 'INV-2024-002',
              date: 'Oct 24, 2023',
              amount: '\$210.15',
            ),
            _invoiceItem(
              invoice: 'INV-2023-998',
              date: 'Oct 23, 2023',
              amount: '\$88.40',
            ),
            _invoiceItem(
              invoice: 'INV-2023-997',
              date: 'Oct 22, 2023',
              amount: '\$1,040.00',
            ),
            const SizedBox(height: 30),
            Center(
              child: Column(
                children: [
                  const Text(
                    'END OF OCTOBER REPORT',
                    style: TextStyle(
                      color: Colors.white38,
                      fontSize: 11,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 12),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.white24),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 28, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'LOAD HISTORY',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // ---------------- WIDGETS ----------------

  Widget _monthlySummaryCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1D23),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'THIS MONTH',
                style: TextStyle(color: Colors.white54, fontSize: 12),
              ),
              Text(
                '+12.5% vs last month',
                style: TextStyle(color: Colors.green, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'Monthly Billing',
            style: TextStyle(color: Colors.white54, fontSize: 13),
          ),
          const SizedBox(height: 6),
          Row(
            children: const [
              Text(
                '\$12,450.00',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 8),
              Icon(Icons.trending_up, color: Colors.green),
            ],
          )
        ],
      ),
    );
  }

  Widget _statsRow() {
    return Row(
      children: [
        Expanded(child: _statCard('Avg Order Value', '\$82.40')),
        const SizedBox(width: 12),
        Expanded(child: _statCard('Pending', '\$1,120.00')),
      ],
    );
  }

  Widget _statCard(String title, String value) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1D23),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white54, fontSize: 12),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          'Recent Invoices',
          style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
        Text(
          'View All',
          style: TextStyle(color: Colors.green, fontSize: 13),
        ),
      ],
    );
  }

  Widget _invoiceItem({
    required String invoice,
    required String date,
    required String amount,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1D23),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  invoice,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                Text(
                  'Created • $date',
                  style:
                  const TextStyle(color: Colors.white38, fontSize: 12),
                ),
                const SizedBox(height: 6),
                Text(
                  amount,
                  style: const TextStyle(
                      color: Colors.green, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.download, color: Colors.white54),
            onPressed: () {},
          ),
          Container(
            height: 38,
            width: 38,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.share, color: Colors.white, size: 18),
          )
        ],
      ),
    );
  }
}

