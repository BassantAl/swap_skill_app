import 'package:flutter/material.dart';
import 'package:swap_skill/core/theme/app_colors.dart';
import 'package:swap_skill/core/theme/app_decoration.dart';

class MyProfileSetting extends StatelessWidget {
  const MyProfileSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration:AppDecoration.containerDecoration(),
      child: Column(
        children: [
          _SettingsItem(
            icon: Icons.notifications_none_outlined,
            title: 'Notifications',
            onTap: () {},
          ),
          _SettingsItem(
            icon: Icons.palette_outlined,
            title: 'Theme',
            onTap: () {},
          ),
          _SettingsItem(
            icon: Icons.lock_outline,
            title: 'Privacy',
            onTap: () {},
          ),
          _SettingsItem(
            icon: Icons.help_outline,
            title: 'Help & Support',
            onTap: () {},
          ),
          _SettingsItem(
            icon: Icons.logout,
            title: 'Logout',
            isLogout: true,
            showArrow: false,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _SettingsItem extends StatelessWidget {
  const _SettingsItem({
    required this.icon,
    required this.title,
    required this.onTap,
    this.isLogout = false,
    this.showArrow = true,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool isLogout;
  final bool showArrow;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: const Color(0xFFC7C4D8),
            ),
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 24,
              color: isLogout
                  ? const Color(0xFFBA1A1A)
                  : AppColors.smallText,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: isLogout
                      ? const Color(0xFFBA1A1A)
                      : const Color(0xFF1A1B22),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            if (showArrow)
              const Icon(
                Icons.chevron_right,
                size: 24,
                color: Color(0xFF494955),
              ),
          ],
        ),
      ),
    );
  }
}