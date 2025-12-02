import 'package:flutter/material.dart';
import '../../../config/theme/app_colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(35), // Capsule shape
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 20,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _NavBarItem(
              assetPath: 'assets/images/home.png',
              isActive: currentIndex == 0,
              onTap: () => onTap(0),
            ),
            _NavBarItem(
              assetPath: 'assets/images/magnifying_glass.png',
              isActive: currentIndex == 1,
              onTap: () => onTap(1),
            ),
            _NavBarItem(
              assetPath: 'assets/images/car.png',
              isActive: currentIndex == 2,
              onTap: () => onTap(2),
            ),
            _NavBarItem(
              assetPath: 'assets/images/user.png',
              isActive: currentIndex == 3,
              onTap: () => onTap(3),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final String assetPath;
  final bool isActive;
  final VoidCallback onTap;

  const _NavBarItem({
    required this.assetPath,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: 70,
        height: 48,
        decoration: BoxDecoration(
          color: isActive ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: Image.asset(
              assetPath,
              key: ValueKey('$assetPath-$isActive'),
              width: 24,
              height: 24,
              color: isActive ? AppColors.background : AppColors.textSecondary,
            ),
          ),
        ),
      ),
    );
  }
}
