import 'package:ahsun_habib/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final Function(String) onNavItemTap;
  final String activeSection;

  const CustomDrawer({
    super.key,
    required this.onNavItemTap,
    this.activeSection = 'Home',
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.primaryNavy,
      child: SafeArea(
        child: Column(
          children: [
            // Drawer Header with Logo
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFF0A1530),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: AppColors.accentTeal,
                        width: 2,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x3320C997),
                          blurRadius: 10,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        'A',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Asap',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'HSUN HABIB',
                    style: TextStyle(
                      fontFamily: 'Asap',
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.2,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(color: Color(0x1AFFFFFF), height: 1),
            const SizedBox(height: 12),

            // Navigation Items
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildDrawerItem(context, 'Home', Icons.home_rounded),
                  _buildDrawerItem(context, 'Skills', Icons.code_rounded),
                  _buildDrawerItem(context, 'Projects', Icons.grid_view_rounded),
                  _buildDrawerItem(context, 'Blog', Icons.article_rounded),
                  _buildDrawerItem(context, 'About Me', Icons.person_rounded),
                ],
              ),
            ),

            // Bottom Contact Button
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accentTeal,
                    foregroundColor: const Color(0xFF060B1E),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  icon: const Icon(Icons.arrow_forward_rounded, size: 18),
                  label: const Text(
                    'Contact Me',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Asap',
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    onNavItemTap('Contact Me');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, String title, IconData icon) {
    final bool isActive = activeSection == title;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        tileColor: isActive ? const Color(0x1A20C997) : Colors.transparent,
        leading: Icon(
          icon,
          color: isActive ? AppColors.accentTeal : const Color(0xFF94A3B8),
          size: 22,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: isActive ? AppColors.accentTeal : Colors.white,
            fontSize: 16,
            fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
            fontFamily: 'Asap',
          ),
        ),
        trailing: isActive
            ? Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: AppColors.accentTeal,
                  shape: BoxShape.circle,
                ),
              )
            : null,
        onTap: () {
          Navigator.of(context).pop();
          onNavItemTap(title);
        },
      ),
    );
  }
}
