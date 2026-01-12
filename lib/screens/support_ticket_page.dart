import 'package:flutter/material.dart';

class SupportTicketPage extends StatelessWidget {
  const SupportTicketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F1F1A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Support & Ticket Status"),
        leading: const BackButton(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Submit a Complaint",
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            _buildDropdown("Select category"),
            const SizedBox(height: 12),

            _buildDropdown("Select recent order"),
            const SizedBox(height: 12),

            _buildTextField("Tell us more about the issue...", maxLines: 4),
            const SizedBox(height: 12),

            _buildUploadBox(),
            const SizedBox(height: 16),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
              ),
              onPressed: () {},
              child: const Text("Submit Ticket"),
            ),

            const SizedBox(height: 24),
            const Text(
              "Ticket Status",
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            _ticketCard(
              title: "Incorrect Toppings",
              status: "Pending",
              statusColor: Colors.orange,
              description:
              "My iced matcha latte was missing the extra whipped cream I paid for.",
            ),

            _ticketCard(
              title: "Payment Refund",
              status: "Resolved",
              statusColor: Colors.green,
              description: "Refund processed successfully.",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown(String hint) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF162D25),
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          dropdownColor: const Color(0xFF162D25),
          iconEnabledColor: Colors.white,
          hint: Text(hint, style: const TextStyle(color: Colors.white54)),
          items: const [],
          onChanged: (_) {},
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, {int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFF162D25),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white54),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildUploadBox() {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: const Color(0xFF162D25),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.camera_alt, color: Colors.white54),
            SizedBox(height: 8),
            Text("Upload photos of the issue", style: TextStyle(color: Colors.white54)),
          ],
        ),
      ),
    );
  }

  Widget _ticketCard({
    required String title,
    required String status,
    required Color statusColor,
    required String description,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF162D25),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(status, style: TextStyle(color: statusColor)),
              )
            ],
          ),
          const SizedBox(height: 8),
          Text(description, style: const TextStyle(color: Colors.white54)),
        ],
      ),
    );
  }
}
