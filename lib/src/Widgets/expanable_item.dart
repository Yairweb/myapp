import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myapp/src/theme/colors.dart';

class ExpandableMenuItem extends StatefulWidget {
  final String title;
  final String activeIconPath; // Ruta del SVG activo
  final String inactiveIconPath; // Ruta del SVG inactivo
  final List<SubcategoryItem> children;

  const ExpandableMenuItem({
    Key? key,
    required this.title,
    required this.activeIconPath,
    required this.inactiveIconPath,
    required this.children,
  }) : super(key: key);

  @override
  _ExpandableMenuItemState createState() => _ExpandableMenuItemState();
}

class _ExpandableMenuItemState extends State<ExpandableMenuItem> {
  bool _isExpanded = false;
  int _selectedIndex = -1; // -1 indica que ninguna subcategoría está seleccionada

  final String _expandedIconPath = 'assets/svg/arrow_up.svg';
  final String _collapsedIconPath = 'assets/svg/arrow_down.svg';

  @override
  Widget build(BuildContext context) {
    return Padding(
      // Envuelve el Column con Padding
      padding: const EdgeInsets.only(
        left: 0.0, // Padding a la izquierda
        top: 0.0, // Padding arriba (ajusta según necesites)
        right: 16.0, // Padding a la derecha
        bottom: 0.0, // Padding abajo (ajusta según necesites)
      ), // Ajusta el padding horizontal aquí
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 37.0,
            decoration: BoxDecoration(
              color: _isExpanded ? AppColors.backCards : AppColors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0.0),
                topRight: Radius.circular(50.0),
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(50.0),
              ),
            ),
            alignment: Alignment.center,
            child: InkWell(
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                  // Reinicia la selección cuando se colapsa el menú
                  if (!_isExpanded) {
                    _selectedIndex = -1;
                  }
                });
              },
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
                      _isExpanded
                          ? widget.activeIconPath
                          : widget.inactiveIconPath,
                      width: 18.0, // Ajusta el tamaño según necesites
                      height: 18.0, // Ajusta el tamaño según necesites
                    ),
                    SizedBox(width: 12.0),
                    Expanded(
                      child: Text(
                        widget.title,
                        style: TextStyle(
                          fontFamily: "inter",
                          fontSize: 14.0,
                          fontWeight: FontWeight.w300,
                          color: _isExpanded ? Colors.black : Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(width: 12.0),
                    SvgPicture.asset(
                      _isExpanded ? _expandedIconPath : _collapsedIconPath,
                      width: 8.0,
                      height: 8.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (_isExpanded)
            Container(
              color: AppColors.white,
              padding: EdgeInsets.symmetric(horizontal: 1, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                    widget.children.asMap().entries.map((entry) {
                      final index = entry.key;
                      final subcategory = entry.value;
                      return Padding(
                        padding: const EdgeInsets.only(
                          left: 30.0,
                        ),
                        child: SubcategoryItem(
                          text: subcategory.text,
                          onTap: () {
                            setState(() {
                              _selectedIndex = index;
                            });
                            if (subcategory.onTap != null) {
                              subcategory.onTap!();
                            }
                          },
                          isSelected: _selectedIndex == index, // Pasa el estado de selección
                          title: Text(subcategory.text), // Puedes ajustar esto si necesitas un título diferente para la subcategoría
                        ),
                      );
                    }).toList(),
              ),
            ),
        ],
      ),
    );
  }
}

class SubcategoryItem extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final bool isSelected; // Nuevo parámetro para el estado de selección

  const SubcategoryItem({
    Key? key,
    required this.text,
    this.onTap,
    required this.isSelected, // Requiere el estado de selección
    required Text title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 32.0,
        margin: const EdgeInsets.symmetric(
          vertical: 5.0,
        ), // Espacio entre subcategorías
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ), // Padding horizontal
        decoration: BoxDecoration(
          color: isSelected ? AppColors.backCards : AppColors.white, // Cambia el color basado en isSelected
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50.0),
            topRight: Radius.circular(50.0),
            bottomLeft: Radius.circular(50.0),
            bottomRight: Radius.circular(50.0),
          ),
        ),
        alignment: Alignment.centerLeft, // Alineación del texto
        child: Text(
          text,
          style: TextStyle(
            fontFamily: "inter",
            fontSize: 14.0,
            fontWeight: FontWeight.w300,
            color: Colors.black, // Color del texto
          ),
        ),
      ),
    );
  }
}
