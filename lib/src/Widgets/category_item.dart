import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myapp/src/theme/colors.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String activeIconPath; // Ruta del SVG activo
  final String inactiveIconPath; // Ruta del SVG inactivo
  final VoidCallback? onTap;
  final bool isSelected;

  const CategoryItem({
    super.key,
    required this.title,
    required this.activeIconPath,
    required this.inactiveIconPath,
    this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 0.0,
        top: 0.0,
        right: 16.0,
        bottom: 0.0,
      ),
      child: Container(
        width: double.infinity,
        height: 37.0,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.backCards : AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(0.0),
            topRight: Radius.circular(50.0),
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(50.0),
          ),
        ),
        alignment: Alignment.center,
        child: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              top: 8.0,
              right: 16.0,
              bottom: 8.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  isSelected ? activeIconPath : inactiveIconPath,
                  width: 18.0,
                  height: 18.0,
                ),
                SizedBox(width: 12.0),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontFamily: "inter",
                      fontSize: 14.0,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(width: 12.0),
                // Espacio para mantener la alineación (sin flecha)
                SizedBox(width: 8.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
} 