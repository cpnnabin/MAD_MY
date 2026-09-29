import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details Screen"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Banner
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.green.shade600, Colors.green.shade400],
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.info_outline, color: Colors.white, size: 40),
                    SizedBox(height: 12),
                    Text(
                      "Flutter Navigation Overview",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "Demonstrating stack-based page navigation and routes.",
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              const Text(
                "Navigation Methods Summary:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),

              _buildDetailCard(
                context,
                title: "1. Navigator.push()",
                description:
                    "Pushes a new route onto the stack of routes managed by the Navigator.",
                code: "Navigator.push(context, MaterialPageRoute(...));",
                icon: Icons.arrow_forward_rounded,
              ),
              const SizedBox(height: 12),

              _buildDetailCard(
                context,
                title: "2. Navigator.pop()",
                description:
                    "Pops the top route off the navigator stack to return to the previous screen.",
                code: "Navigator.pop(context);",
                icon: Icons.arrow_back_rounded,
              ),
              const SizedBox(height: 12),

              _buildDetailCard(
                context,
                title: "3. pushReplacement()",
                description:
                    "Replaces the current route with a new route, removing the previous screen from memory.",
                code: "Navigator.pushReplacementNamed(context, '/buttons');",
                icon: Icons.published_with_changes_rounded,
              ),
              const SizedBox(height: 12),

              _buildDetailCard(
                context,
                title: "4. Named Routes",
                description:
                    "Pre-defined route strings registered in MaterialApp for easy app navigation.",
                code: "Navigator.pushNamed(context, '/profile');",
                icon: Icons.alt_route_rounded,
              ),
              const SizedBox(height: 32),

              // Back Button (Demonstrating Navigator.pop)
              Center(
                child: SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Demonstrating Navigator.pop(context)
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                    label: const Text(
                      "Return to Previous Screen (Navigator.pop)",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailCard(
    BuildContext context, {
    required String title,
    required String description,
    required String code,
    required IconData icon,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.green.shade700),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(color: Colors.grey.shade700, fontSize: 13),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                code,
                style: const TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 12,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
