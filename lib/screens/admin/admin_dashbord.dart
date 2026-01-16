import 'package:flutter/material.dart';

class AdminDashbord extends StatefulWidget {
  const AdminDashbord({super.key});

  @override
  State<AdminDashbord> createState() => _AdminDashbordState();
}

class _AdminDashbordState extends State<AdminDashbord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _topBar(),
              const SizedBox(height: 20),
              _statsGrid(),
              const SizedBox(height: 24),
              _recentOrdersHeader(),
              const SizedBox(height: 12),
              Expanded(child: _recentOrdersList()),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔹 TOP BAR
  Widget _topBar() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 22,
          backgroundImage: AssetImage('assets/images/unnamed.jpg'),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Admin Sarah',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'STORE MANAGER',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 11,
                  letterSpacing: 1),
            ),
          ],
        ),
        const Spacer(),
        _iconCircle(Icons.notifications_none),
        const SizedBox(width: 10),
        _iconCircle(Icons.search),
      ],
    );
  }

  Widget _iconCircle(IconData icon) {
    return Container(
      height: 36,
      width: 36,
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, color: Colors.white, size: 20),
    );
  }

  /// 🔹 STATS GRID
  Widget _statsGrid() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      crossAxisSpacing: 14,
      mainAxisSpacing: 14,
      childAspectRatio: 1.3,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        _StatCard(
          title: 'Total Orders',
          value: '1,284',
          percent: '+12%',
          icon: Icons.shopping_bag,
          color: Colors.cyan,
        ),
        _StatCard(
          title: "Today's Revenue",
          value: '\$4,320.50',
          percent: '+8%',
          icon: Icons.attach_money,
          color: Colors.orange,
        ),
        _StatCard(
          title: 'Active Bookings',
          value: '12 Tables',
          icon: Icons.chair_alt,
          color: Colors.teal,
        ),
        _StatCard(
          title: 'Pending Orders',
          value: '8',
          icon: Icons.pending_actions,
          color: Colors.deepOrange,
        ),
      ],
    );
  }

  /// 🔹 RECENT ORDERS HEADER
  Widget _recentOrdersHeader() {
    return Row(
      children: const [
        Text(
          'Recent Orders',
          style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        Spacer(),
        Text(
          'VIEW ALL',
          style: TextStyle(
              color: Colors.cyan,
              fontSize: 12,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  /// 🔹 RECENT ORDERS LIST
  Widget _recentOrdersList() {
    return ListView(
      children: const [
        _OrderTile(
          name: 'John Doe',
          orderId: '#ORD-9921',
          price: '\$45.00',
          status: 'PENDING',
          statusColor: Colors.orange,
        ),
        _OrderTile(
          name: 'Jane Smith',
          orderId: '#ORD-9920',
          price: '\$120.50',
          status: 'PREPARING',
          statusColor: Colors.amber,
        ),
        _OrderTile(
          name: 'Robert Fox',
          orderId: '#ORD-9919',
          price: '\$32.25',
          status: 'DELIVERED',
          statusColor: Colors.green,
        ),
        _OrderTile(
          name: 'Albert Flores',
          orderId: '#ORD-9918',
          price: '\$89.00',
          status: 'DELIVERED',
          statusColor: Colors.green,
        ),
      ],
    );
  }
}

/// 🔹 STAT CARD
class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final String? percent;
  final IconData icon;
  final Color color;

  const _StatCard({
    required this.title,
    required this.value,
    this.percent,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: color, size: 20),
              ),
              const Spacer(),
              if (percent != null)
                Text(
                  percent!,
                  style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
            ],
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

/// 🔹 ORDER TILE
class _OrderTile extends StatelessWidget {
  final String name;
  final String orderId;
  final String price;
  final String status;
  final Color statusColor;

  const _OrderTile({
    required this.name,
    required this.orderId,
    required this.price,
    required this.status,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: statusColor.withOpacity(0.15),
            child: Icon(Icons.receipt, color: statusColor),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text('$orderId • $price',
                    style:
                    const TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
          Container(
            padding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              status,
              style: TextStyle(
                  color: statusColor,
                  fontSize: 11,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
