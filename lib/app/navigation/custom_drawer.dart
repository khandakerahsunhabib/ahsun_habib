import 'package:flutter/material.dart';
import 'package:ahsun_habib/core/utils/assets_path.dart';

class CustomDrawer extends StatelessWidget {
  final Function(String) onNavItemTap;

  const CustomDrawer({super.key, required this.onNavItemTap});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black87,
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black,
                  Colors.grey.shade800,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: SizedBox(
                width: 200,
                child: Image.asset(AssetsPath.websiteLogo, fit: BoxFit.contain),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildDrawerItem(context, 'Home', Icons.home),
                _buildDrawerItem(context, 'Skills', Icons.star),
                _buildDrawerItem(context, 'Projects', Icons.work),
                _buildDrawerItem(context, 'Blog', Icons.article),
                _buildDrawerItem(context, 'About Me', Icons.person),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                icon: const Icon(Icons.mail),
                label: const Text(
                  'Contact Me',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.of(context).pop(); // Close drawer
                  onNavItemTap('Contact Me');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, String title, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Colors.teal.shade300),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: () {
        Navigator.of(context).pop(); // Close drawer
        onNavItemTap(title);
      },
    );
  }
}
