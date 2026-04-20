import 'package:flutter/material.dart';
import 'package:rest_api_crud/app/routes.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[600],
        title: Text(
          'Menu',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            MenuItem(
              icon: Icons.person,
              title: 'Câu 1',
              subtitle: 'Fetch User List (GET API)',
              color: Colors.blue,
              onTap: () {
                Navigator.pushNamed(context, Routes.cau1);
              },
            ),
            MenuItem(
              icon: Icons.shopping_cart,
              title: 'Câu 2',
              subtitle: 'Product detail (GET + JSON Parse)',
              color: Colors.green,
              onTap: () {
                Navigator.pushNamed(context, Routes.cau2);
              },
            ),
            MenuItem(
              icon: Icons.post_add,
              title: 'Câu 3',
              subtitle: 'Create Post (POST API)',
              color: Colors.orange,
              onTap: () {
                Navigator.pushNamed(context, Routes.cau3);
              },
            ),
            MenuItem(
              icon: Icons.shopping_bag,
              title: 'Câu 4',
              subtitle: 'Product List -> Product Detail',
              color: Colors.red,
              onTap: () {
                Navigator.pushNamed(context, Routes.cau4);
              },
            ),
            MenuItem(
              icon: Icons.palette,
              title: 'Câu 5',
              subtitle: 'Pick Color (Return Data)',
              color: Colors.purple,
              onTap: () {
                Navigator.pushNamed(context, Routes.cau5);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  const MenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, size: 32, color: color),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 20, color: Colors.grey[400]),
            ],
          ),
        ),
      ),
    );
  }
}
