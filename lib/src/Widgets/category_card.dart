import 'package:flutter/material.dart';

class CategoryItem extends StatefulWidget {
  final String imageUrl;
  final String categoryName;

  const CategoryItem({
    super.key,
    required this.imageUrl,
    required this.categoryName,
  });

  @override
  _CategoryItemState createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      // O un Container con decoración similar
      elevation: 2.0, // Sombra ligera
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0), // Bordes redondeados
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(8.0),
              ), // Bordes redondeados en la parte superior
              child: Image.network(
                // O Image.asset si las imágenes son locales
                widget.imageUrl,
                fit: BoxFit.cover, // Ajusta la imagen para cubrir el espacio
                // Puedes añadir un loadingBuilder o errorBuilder aquí
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.categoryName,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
