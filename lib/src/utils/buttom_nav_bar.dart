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
    return Container(
      // Envuelve el ClipRRect en un Container
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          // Mueve el borderRadius a la BoxDecoration
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Color de la sombra
            spreadRadius: 0, // Cuánto se extiende la sombra
            blurRadius: 5, // Cuánto se difumina la sombra
            offset: Offset(
              0,
              -1,
            ), // Posición de la sombra (negativo para arriba)
          ),
        ],
      ),
      child: ClipRRect(
        // Mantén el ClipRRect para el recorte visual si lo necesitas
        borderRadius: BorderRadius.only(
          // Mueve el borderRadius a la BoxDecoration para la sombra
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svg/logo_inactivo.svg',
                height: 24.0,
              ),
              activeIcon: SvgPicture.asset(
                'assets/svg/logo_activo.svg',
                height: 24.0,
              ),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svg/categories_inactive.svg',
                height: 24.0,
              ),
              activeIcon: SvgPicture.asset(
                'assets/svg/categories_active.svg',
                height: 24.0,
              ),
              label: 'Tienda',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svg/orders_inactive.svg',
                height: 24.0,
              ),
              activeIcon: SvgPicture.asset(
                'assets/svg/orders_activo.svg',
                height: 24.0,
              ),
              label: 'Pedidos',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svg/cart_inactive.svg',
                height: 24.0,
              ),
              activeIcon: SvgPicture.asset(
                'assets/svg/cart_active.svg',
                height: 24.0,
              ),
              label: 'Carrito',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/svg/users_inactive.svg',
                height: 24.0,
              ),
              activeIcon: SvgPicture.asset(
                'assets/svg/users_active.svg',
                height: 24.0,
              ),
              label: 'Perfil',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: AppColors.orangeBrand,
          unselectedItemColor: AppColors.black,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          iconSize: 24.0,
        ),
      ),
    );
  }
}
