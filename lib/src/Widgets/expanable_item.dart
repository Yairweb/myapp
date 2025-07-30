import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myapp/src/theme/colors.dart';

class ExpandableMenuItem extends StatefulWidget {
  final IconData icon;
  final String title;
  final List<Widget> children;

  const ExpandableMenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.children,
  });

  @override
  _ExpandableMenuItemState createState() => _ExpandableMenuItemState();
}

class _ExpandableMenuItemState extends State<ExpandableMenuItem> {
  bool _isExpanded = false;
  Color _containerColor =
      AppColors.white; // Variable para el color del Container de los hijos
  Color _iconColor = AppColors.black;

  final String _expandedIconPath = 'assets/svg/arrow_up.svg';
  final String _collapsedIconPath = 'assets/svg/arrow_down.svg';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Envuelve el ListTile en un Container
        Container(
          width: double.infinity,
          height: 40.0,
          decoration: BoxDecoration(
            color:
                _isExpanded
                    ? AppColors.backCards
                    : AppColors.white, // Color de fondo condicional
            borderRadius: BorderRadius.circular(
              10.0,
            ), // Radio para redondear las esquinas
          ),
          child: ListTile(
            leading: Icon(
              widget.icon,
              color: _iconColor,
              size:
                  20.0, // Define el tamaño del icono (ajusta el valor según sea necesario)
            ),
            title: Text(
              widget.title,
              style: TextStyle(
                fontFamily: "inter",
                fontSize: 16.0,
                fontWeight: FontWeight.w300,
                color: _isExpanded ? Colors.black : Colors.black,
              ),
            ),
            trailing:
            // Usa SvgPicture.asset para mostrar los iconos SVG
            SvgPicture.asset(
              _isExpanded ? _expandedIconPath : _collapsedIconPath,
              width: 8.0, // Define el ancho del icono SVG
              height: 8.0, // Define la altura del icono SVG
              // Puedes agregar color si tus SVG son monocromáticos y quieres cambiarles el color
              // color: Colors.black,
            ),
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
                // Actualiza el color del Container basado en el estado de expansión
                _containerColor =
                    _isExpanded ? Colors.grey[200]! : Colors.transparent;
                _iconColor = _isExpanded ? Colors.orange : Colors.black;
              });
            },
          ),
        ),
        if (_isExpanded)
          Container(
            color: _containerColor,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              // Centra los elementos hijos horizontalmente
              crossAxisAlignment: CrossAxisAlignment.center,
              children:
                  widget.children.map((child) {
                    return child;
                  }).toList(),
            ),
          ),
      ],
    );
  }
}
