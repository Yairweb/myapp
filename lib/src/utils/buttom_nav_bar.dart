import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myapp/src/theme/colors.dart';

class BottomNavBar extends StatefulWidget {
  final ValueChanged<int> onTabTapped;

  const BottomNavBar({super.key, required this.onTabTapped});

  @override
  BottomNavBarState createState() => BottomNavBarState();
}

class BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onTabTapped(index);
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16.0),
        topRight: Radius.circular(16.0),
      ),
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/logo_inactivo.svg',
              height: 24.0,
            ), // Usar SvgPicture.asset
            activeIcon: SvgPicture.asset(
              'assets/svg/logo_activo.svg',
              height: 24.0,
            ), // Usar SvgPicture.asset
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/categories_inactive.svg',
              height: 24.0,
            ), // Usar SvgPicture.asset
            activeIcon: SvgPicture.asset(
              'assets/svg/categories_active.svg',
              height: 24.0,
            ), // Usar SvgPicture.asset
            label: 'Tienda',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/orders_inactive.svg',
              height: 24.0,
            ), // Usar SvgPicture.asset
            activeIcon: SvgPicture.asset(
              'assets/svg/orders_activo.svg',
              height: 24.0,
            ), // Usar SvgPicture.asset
            label: 'Pedidos',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/cart_inactive.svg',
              height: 24.0,
            ), // Usar SvgPicture.asset
            activeIcon: SvgPicture.asset(
              'assets/svg/cart_active.svg',
              height: 24.0,
            ), // Usar SvgPicture.asset
            label: 'Carrito',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/svg/users_inactive.svg',
              height: 24.0,
            ), // Usar SvgPicture.asset
            activeIcon: SvgPicture.asset(
              'assets/svg/users_active.svg',
              height: 24.0,
            ), // Usar SvgPicture.asset
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor:
            AppColors.orangeBrand, // Replaced with AppColors.orangeBrand
        unselectedItemColor: AppColors.black, // Replaced with AppColors.black
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        iconSize:
            24.0, // Aún puedes controlar el tamaño con iconSize si lo deseas, o directamente con height en SvgPicture.asset
      ),
    );
  }
}
