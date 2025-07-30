import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myapp/src/Widgets/expanable_item.dart';

class MenuLateral extends StatelessWidget {
  const MenuLateral({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          // Removed DrawerHeader and added content directly
          SafeArea(
            child: Container(
              height: 60, // Adjust height as needed
              padding: EdgeInsets.symmetric(horizontal: 16.0), // Add padding
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SvgPicture.asset(
                      'assets/svg/logomayoreo.svg',
                      height: 23,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          ExpandableMenuItem(
            title: 'Categorías',
            activeIconPath:
                'assets/svg/categorie_active.svg', // Reemplaza con la ruta de tu icono activo
            inactiveIconPath:
                'assets/svg/categorie_inactive.svg', // Reemplaza con la ruta de tu icono inactivo
            children: [
              ListTile(
                title: Text('Subcategoría 1'),
                onTap: () {
                  // Acción al seleccionar Subcategoría 1
                },
              ),
              ListTile(
                title: Text('Subcategoría 2'),
                onTap: () {
                  // Acción al seleccionar Subcategoría 2
                },
              ),
            ],
          ),

          ListTile(
            leading: Icon(Icons.shopping_bag_outlined), // Icono de pedidos
            title: Text('Mis pedidos'),
            onTap: () {
              // Acción al seleccionar Pedidos
            },
          ),
          ListTile(
            leading: Icon(Icons.credit_card), // Icono de métodos de pago
            title: Text('Métodos de pago'),
            onTap: () {
              // Acción al seleccionar Nosotros
            },
          ),
          ListTile(
            leading: Icon(Icons.location_on_outlined), // Icono de direcciones
            title: Text('Direcciones'),
            onTap: () {
              // Acción al seleccionar Contacto
            },
          ),
          ListTile(
            leading: Icon(Icons.list_alt), // Icono de mis listas
            title: Text('Mis listas'),
            onTap: () {
              // Acción al seleccionar Mis listas
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite_border), // Icono de favoritos
            title: Text('Favoritos'),
            onTap: () {
              // Acción al seleccionar Favoritos
            },
          ),
          ListTile(
            leading: Icon(Icons.help_outline), // Icono de soporte
            title: Text('Soporte a mayorista'),
            onTap: () {
              // Acción al seleccionar Soporte
            },
          ),
          ListTile(
            leading: Icon(Icons.book_outlined), // Icono de catálogo
            title: Text('Catálogo'),
            onTap: () {
              // Acción al seleccionar Catálogo
            },
          ),
        ],
      ),
    );
  }
}
