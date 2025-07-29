import 'package:flutter/material.dart';
import 'package:myapp/src/Widgets/homeheader.dart'; // Import the new widget
import 'package:myapp/src/Widgets/productsearchbar.dart'; // Import the ProductSearchBar widget
import 'package:myapp/src/Widgets/counterpromotion.dart';
import 'package:myapp/src/utils/buttom_nav_bar.dart';
import 'package:myapp/src/utils/menu_lateral.dart'; // Import the CounterPromotion widget
import 'package:myapp/src/Widgets/category_card.dart'; // Import CategoryItem

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  // Datos de ejemplo para las categorías
  final List<Map<String, String>> categories = const [
    {
      'name': 'Accesorios',
      'imageUrl':
          'https://blife-mx-categorias.s3.amazonaws.com/accesorios-8b9c54-movil.webp',
    },
    {'name': 'Ropa', 'imageUrl': 'https://via.placeholder.com/150'},
    {'name': 'Hogar', 'imageUrl': 'https://via.placeholder.com/150'},
    {'name': 'Deportes', 'imageUrl': 'https://via.placeholder.com/150'},
    {'name': 'Libros', 'imageUrl': 'https://via.placeholder.com/150'},
    {'name': 'Juguetes', 'imageUrl': 'https://via.placeholder.com/150'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuLateral(),
      body: Builder(
        builder:
            (context) => SafeArea(
              child: Column(
                children: [
                  CounterPromotion(),
                  HomeHeader(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: ProductSearchBar(),
                  ),
                  Expanded(
                    child: Padding(
                      // Eliminado SingleChildScrollView
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Explora por categorías',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 16.0),
                          Expanded(
                            // Envuelve el GridView.builder en Expanded
                            child: GridView.builder(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, // Número de columnas
                                crossAxisSpacing:
                                    16.0, // Espacio horizontal entre elementos
                                mainAxisSpacing:
                                    16.0, // Espacio vertical entre elementos
                                childAspectRatio:
                                    1.2, // Relación de aspecto de los elementos (ancho/alto)
                              ),
                              itemCount:
                                  categories
                                      .length, // Número total de elementos
                              itemBuilder: (context, index) {
                                // Construye un CategoryItem para cada elemento de la lista
                                return CategoryItem(
                                  categoryName: categories[index]['name']!,
                                  imageUrl: categories[index]['imageUrl']!,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
      ),
      bottomNavigationBar: BottomNavBar(
        onTabTapped: (index) {
          switch (index) {
            case 0:
              break;
            case 1:
              break;
            case 2:
              break;
            case 3:
              break;
            case 4:
              break;
          }
        },
      ),
    );
  }
}
