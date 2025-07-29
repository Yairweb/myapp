import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MenuLateral extends StatelessWidget {
  const MenuLateral({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white, // Puedes ajustar el color de fondo
            ),
            child: Stack(
              children: [
                Align(
                  alignment:
                      Alignment
                          .centerLeft, // Logo a la izquierda y centrado verticalmente
                  child: SvgPicture.asset(
                    'assets/svg/logomayoreo.svg', // Reemplaza con la ruta de tu logo
                    height: 30, // Ajusta la altura según sea necesario
                  ),
                ),
                Align(
                  alignment:
                      Alignment
                          .centerRight, // Icono a la derecha y centrado verticalmente
                  child: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context); // Cierra el Drawer
                    },
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.category), // Icono de categorías
            title: Text('Categorías'),
            trailing: Icon(
              Icons.arrow_drop_down,
            ), // Icono de flecha hacia abajo
            onTap: () {
              // Acción al seleccionar Categorías
              // Puedes navegar a la vista de categorías aquí si no estás ya en ella
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_bag_outlined), // Icono de pedidos
            title: Text('Mis pedidos'),
            onTap: () {
              // Acción al seleccionar Mis pedidos
            },
          ),
          ListTile(
            leading: Icon(Icons.payment), // Icono de métodos de pago
            title: Text('Métodos de pago'),
            onTap: () {
              // Acción al seleccionar Métodos de pago
            },
          ),
          ListTile(
            leading: Icon(Icons.location_on_outlined), // Icono de direcciones
            title: Text('Direcciones'),
            onTap: () {
              // Acción al seleccionar Direcciones
            },
          ),
          ListTile(
            leading: Icon(Icons.list_alt), // Icono de listas
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
          Divider(), // Línea divisoria
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'J. Antonio Flores', // Nombre del usuario (puedes hacerlo dinámico)
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                InkWell(
                  // Para que "Ver perfil" sea clickeable
                  onTap: () {
                    // Acción al hacer clic en Ver perfil
                  },
                  child: Row(
                    children: [
                      Text(
                        'Ver perfil',
                        style: TextStyle(color: Colors.blue), // Color de enlace
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.logout), // Icono de cerrar sesión
            title: Text('Cerrar sesión'),
            onTap: () {
              // Acción al seleccionar Cerrar sesión
            },
          ),
        ],
      ),
    );
  }
}
