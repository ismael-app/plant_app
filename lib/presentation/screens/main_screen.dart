import 'package:flutter/material.dart';
import 'package:plant_app/config/theme/app_colors.dart';
import 'package:plant_app/presentation/screens/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const Center(child: Text('Cart')),
    const Center(child: Text('Favorite')),
    const Center(child: Text('Profile')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: IndexedStack(index: _currentIndex, children: _pages),

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 10.0),
          child: Container(
            height: 70.0,

            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(35.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.15),
                  blurRadius: 15.0,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavItem(Icons.home_filled, Icons.home_outlined, 0),
                _buildNavItem(
                  Icons.shopping_basket,
                  Icons.shopping_basket_outlined,
                  1,
                ),
                _buildNavItem(Icons.favorite, Icons.favorite_border, 2),
                _buildNavItem(Icons.person, Icons.person_outline, 3),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: NavigationBar(
      //   selectedIndex: _currentIndex,
      //   onDestinationSelected: (int index) {
      //     setState(() {
      //       _currentIndex = index;
      //     });
      //   },
      //   // backgroundColor: AppColors.primary,
      //   destinations: const [
      //     NavigationDestination(
      //       label: 'Home',
      //       icon: Icon(Icons.home_filled),
      //       selectedIcon: Icon(Icons.home_filled),
      //     ),
      //     NavigationDestination(
      //       label: 'Cart',
      //       icon: Icon(Icons.shopping_basket_outlined),
      //       selectedIcon: Icon(Icons.shopping_basket),
      //     ),
      //     NavigationDestination(
      //       label: 'Favorites',
      //       icon: Icon(Icons.favorite_border),
      //       selectedIcon: Icon(Icons.favorite),
      //     ),
      //     NavigationDestination(
      //       label: 'Profile',
      //       icon: Icon(Icons.person_outlined),
      //       selectedIcon: Icon(Icons.person),
      //     ),
      //   ],
      // ),
    );
  }

  Widget _buildNavItem(IconData iconActive, IconData iconInactive, int index) {
    final bool isActive = _currentIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: isActive
              ? Colors.white.withValues(alpha: 0.15)
              : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Icon(
          isActive ? iconActive : iconInactive,
          color: isActive ? Colors.white : Colors.white70,
          size: 26,
        ),
      ),
    );
  }
}
