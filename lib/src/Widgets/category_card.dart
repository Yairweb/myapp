import 'package:flutter/material.dart';
import 'package:myapp/src/theme/colors.dart';
// Importa tu archivo de colores si tienes uno definido
// import 'package:myapp/src/theme/colors.dart';

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
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8.0), // Bordes redondeados
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height:
                109.0, // Altura controlada para la imagen (ajusta si es necesario)
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(8.0),
                bottom: Radius.circular(8.0),
              ), // Bordes redondeados en la parte superior de la imagen
              child: Image.network(
                widget.imageUrl,
                fit: BoxFit.cover, // Ajusta la imagen para cubrir el espacio
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(7.0),
            child: Text(
              widget.categoryName,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.0,
                fontFamily: "inter",
                fontWeight: FontWeight.w300,
                color: AppColors.black,
              ), // Estilo del texto
            ),
          ),
        ],
      ),
    );
  }
}
