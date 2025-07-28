import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Asegúrate de importar PreferredSizeWidget
class HomeHeader extends StatelessWidget implements PreferredSizeWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 5.0,
        ), // Add vertical padding
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: SvgPicture.asset('assets/svg/burguer.svg', height: 24.0),
              onPressed: () {
                // TODO: Implementar acción para abrir el menú
              },
            ),
            SvgPicture.asset('assets/svg/logomayoreo.svg', height: 25.0),
            IconButton(
              icon: SvgPicture.asset('assets/svg/cart_icon.svg', height: 22.0),
              onPressed: () {
                // TODO: Implementar acción para abrir el carrito
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 16.0); // Adjust preferredSize to account for padding
}
