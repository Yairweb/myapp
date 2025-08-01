import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myapp/src/Widgets/category_item.dart';
import 'package:myapp/src/Widgets/expanable_item.dart';
import 'package:myapp/src/theme/colors.dart';

class MenuLateral extends StatefulWidget {
  const MenuLateral({super.key});

  @override
  _MenuLateralState createState() => _MenuLateralState();
}

class _MenuLateralState extends State<MenuLateral> {
  int _selectedCategoryIndex =
      -1; // -1 significa que ninguna categoría está seleccionada

  void _selectCategory(int index) {
    setState(() {
      _selectedCategoryIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          // Lista principal de elementos del menú
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                // Removed DrawerHeader and added content directly
                SafeArea(
                  child: Container(
                    height: 40, // Adjust height as needed
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ), // Add padding
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
                  activeIconPath: 'assets/svg/categorie_active.svg',
                  inactiveIconPath: 'assets/svg/categorie_inactive.svg',
                  children: [
                    SubcategoryItem(
                      title: Text('Subcategoría 1'),
                      onTap: () {
                        _selectCategory(0);
                      },
                      text: 'Vitaminas y más',
                      isSelected: _selectedCategoryIndex == 0,
                    ),
                    SubcategoryItem(
                      title: Text('Subcategoría 2'),
                      onTap: () {
                        _selectCategory(1);
                      },
                      text: 'Ofertas del mes',
                      isSelected: _selectedCategoryIndex == 1,
                    ),
                  ],
                ),
                SizedBox(height: 5.0),
                CategoryItem(
                  title: "Mis pedidos",
                  activeIconPath: "assets/svg/pedidos_active.svg",
                  inactiveIconPath: "assets/svg/pedidos_inactive.svg",
                  isSelected: _selectedCategoryIndex == 2,
                  onTap: () {
                    _selectCategory(2);
                  },
                ),
                SizedBox(height: 5.0),
                CategoryItem(
                  title: "Métodos de pago",
                  activeIconPath: "assets/svg/card_active.svg",
                  inactiveIconPath: "assets/svg/card_inactive.svg",
                  isSelected: _selectedCategoryIndex == 3,
                  onTap: () {
                    _selectCategory(3);
                  },
                ),
                SizedBox(height: 5.0),
                CategoryItem(
                  title: "Direcciones",
                  activeIconPath: "assets/svg/ubication_active.svg",
                  inactiveIconPath: "assets/svg/ubication_inactive.svg",
                  isSelected: _selectedCategoryIndex == 4,
                  onTap: () {
                    _selectCategory(4);

                  },
                ),
                SizedBox(height: 5.0),
                CategoryItem(
                  title: "Mis listas",
                  activeIconPath: "assets/svg/list_active.svg",
                  inactiveIconPath: "assets/svg/list_inactive.svg",
                  isSelected: _selectedCategoryIndex == 5,
                  onTap: () {
                    _selectCategory(5);
                  },
                ),
                SizedBox(height: 5.0),
                CategoryItem(
                  title: "Favoritos",
                  activeIconPath: "assets/svg/fav_active.svg",
                  inactiveIconPath: "assets/svg/fav_inactive.svg",
                  isSelected: _selectedCategoryIndex == 6,
                  onTap: () {
                    _selectCategory(6);
                  },
                ),
                SizedBox(height: 5.0),
                CategoryItem(
                  title: "Soporte a mayorista",
                  activeIconPath: "assets/svg/help_active.svg",
                  inactiveIconPath: "assets/svg/help_inactive.svg",
                  isSelected: _selectedCategoryIndex == 7,
                  onTap: () {
                    _selectCategory(7);
                  },
                ),
                SizedBox(height: 5.0),
                CategoryItem(
                  title: "Catálogo",
                  activeIconPath: "assets/svg/document_active.svg",
                  inactiveIconPath: "assets/svg/document_inactive.svg",
                  isSelected: _selectedCategoryIndex == 8,
                  onTap: () {
                    _selectCategory(8);
                  },
                ),
              ],
            ),
          ),

          // Sección de perfil de usuario (fija en la parte inferior)
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nombre del usuario
                Text(
                  'J. Antonio Flores',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 4.0),
                // Opción "Ver perfil"
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    // Acción para ver perfil
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Ver perfil',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(width: 4.0),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16.0,
                        color: Colors.grey[600],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 16.0),

          // Opción "Cerrar sesión"
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                // Acción para cerrar sesión
              },
              child: Row(
                                 children: [
                   SvgPicture.asset(
                     'assets/svg/back_icon.svg',
                     width: 20.0,
                     height: 20.0,
                   ),
                   SizedBox(width: 8.0),
                   Text(
                     'Cerrar sesión',
                     style: TextStyle(fontSize: 14.0, fontFamily: "inter", color: AppColors.black,
                   ),
                   ),
                 ],
              ),
            ),
          ),

          // Separador final
          Divider(height: 32.0, thickness: 1.0, color: Colors.transparent),
        ],
      ),
    );
  }
}
