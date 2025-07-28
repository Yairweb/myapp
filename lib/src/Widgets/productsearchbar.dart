import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myapp/src/theme/colors.dart';

class ProductSearchBar extends StatelessWidget {
  const ProductSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36.0, // Altura máxima de 36 px
      margin: const EdgeInsets.symmetric(
        horizontal: 15.0,
      ), // Margen a los lados
      padding: const EdgeInsets.only(
        left: 12.0,
        right: 0.0,
      ), // Padding interno: 12px izq, 10px der
      decoration: BoxDecoration(
        color: AppColors.backCards, // Color de fondo gris claro
        borderRadius: BorderRadius.circular(30.0), // Bordes redondeados
        border: Border.all(
          color: AppColors.silverGrayMedium, // Color del borde
          width: 0.5, // Ancho del borde
        ),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Buscar en B Life®️ Mayoreo',
          border: InputBorder.none, // Sin borde por defecto del TextField
          suffixIcon: Padding(
            padding: const EdgeInsets.all(5.0), // Add padding around the SVG
            child: SvgPicture.asset('assets/svg/search_icon.svg'),
          ), // Icono de búsqueda a la derecha
          contentPadding: EdgeInsets.symmetric(
            vertical: 10,
          ), // Ajustar padding vertical del contenido
        ),
        textAlignVertical:
            TextAlignVertical.center, // Centrar verticalmente el texto
        style: TextStyle(fontSize: 14.0), // Tamaño de fuente a 14
      ),
    );
  }
}
