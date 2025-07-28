import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:myapp/src/inicio_sesion.dart';
import 'package:myapp/src/theme/colors.dart';
import 'package:myapp/src/Widgets/custom_text_input.dart';

Future<dynamic> showModalLoginRegister(BuildContext context, Size size) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: _LoginModalRegisterContent(
            size: size,
          ), // Use the new StatefulWidget
        ),
      );
    },
  );
}

class _LoginModalRegisterContent extends StatefulWidget {
  final Size size;

  const _LoginModalRegisterContent({required this.size});

  @override
  __LoginModalRegisterContentState createState() =>
      __LoginModalRegisterContentState();
}

class __LoginModalRegisterContentState
    extends State<_LoginModalRegisterContent> {
  bool _aceptaTerminos = false;

  @override
  Widget build(BuildContext context) {
    var height = kToolbarHeight;
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: height - 20),
        height:
            widget.size.height *
            0.87, // Puedes ajustar la altura según necesites
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            // Permite el scroll cuando aparece el teclado
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 40,
                  height: 3,
                  decoration: BoxDecoration(
                    color: AppColors.silverGrayMedium,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Regístrate",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w700,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  "Ingresa tu información para crear tu perfil",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w300,
                    color: AppColors.slateCoolGray,
                  ),
                ),
                const SizedBox(height: 16),
                CustomTextInput(
                  hintText: "Nombre(s)*",
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 16),
                CustomTextInput(
                  hintText: "Apellido paterno*",
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 16),
                CustomTextInput(
                  hintText: "Apellido materno*",
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 16),
                CustomTextInput(
                  hintText: "Whatsapp*",
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                CustomTextInput(
                  hintText: "Correo electrónico*",
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 16),
                CustomTextInput(
                  hintText: "Empresa (opcional)",
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    CustomCheckbox(
                      value: _aceptaTerminos,
                      onChanged: (newValue) {
                        setState(() {
                          _aceptaTerminos = newValue ?? false;
                        });
                      },
                    ),
                    SizedBox(width: 5.0),
                    Expanded(
                      child: GestureDetector(
                        // O TextButton si prefieres un efecto visual de botón
                        onTap: () {
                          // TODO: Navegar a la pantalla de términos y condiciones
                          print("Términos y Condiciones pressed");
                        },
                        child: RichText(
                          text: TextSpan(
                            text: 'Leí y acepto los ',
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 14.0,
                              fontWeight: FontWeight.w300,
                              color: AppColors.black,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Términos y Condiciones.',
                                style: TextStyle(
                                  color: const Color.fromARGB(
                                    255,
                                    26,
                                    115,
                                    233,
                                  ), // Color de enlace
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed:
                      _aceptaTerminos
                          ? () {
                            showModalCodeLogin(context, widget.size);
                          }
                          : null, // Deshabilita el botón si no se aceptan los términos
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(widget.size.width * 0.9, 40),
                    backgroundColor: AppColors.orangeBrand,
                    elevation: 0,
                  ),
                  child: AnimatedDefaultTextStyle(
                    style: TextStyle(
                      fontSize: 14.0,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w300,
                      color:
                          _aceptaTerminos
                              ? AppColors.white
                              : AppColors.warmGray,
                    ),
                    duration: const Duration(
                      milliseconds: 0,
                    ), // Adjust duration as needed
                    child: const Text("Registrarse y validar información"),
                  ),
                ),
                const SizedBox(height: 16), // Espacio al final del modal
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?>? onChanged;
  final Color activeColor;
  final Color inactiveColor;
  final double radius;
  final double borderWidth;

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.activeColor = AppColors.orangeBrand, // Default active color
    this.inactiveColor = AppColors.white, // Default inactive color
    this.radius = 12.0, // Default radius
    this.borderWidth = 1.5, // Default border width
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onChanged != null) {
          onChanged!(!value); // Toggle the value
        }
      },
      child: SizedBox(
        width: radius * 2, // Total width
        height: radius * 2, // Total height
        child: Stack(
          alignment: Alignment.center, // Center the children in the Stack
          children: [
            // Outer Circle (Border)
            Container(
              width: radius * 1.5,
              height: radius * 1.5,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color:
                      value
                          ? activeColor
                          : AppColors.silverGrayMedium, // Border color
                  width: borderWidth,
                ),
              ),
            ),
            // Inner Circle (Orange filled circle when active)
            if (value) // Only show the inner circle when active
              Container(
                width: radius * 0.9, // Adjust size for white space
                height: radius * 0.9, // Adjust size for white space
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: activeColor, // Inner circle color
                ),
              ),
          ],
        ),
      ),
    );
  }
}

Future<dynamic> showModalCodeLogin(BuildContext context, Size size) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: _LoginModalCodeContent(
            size: size,
          ), // Use the new StatefulWidget
        ),
      );
    },
  );
}

class _LoginModalCodeContent extends StatefulWidget {
  final Size size;

  const _LoginModalCodeContent({required this.size});

  @override
  __LoginModalCodeContentState createState() => __LoginModalCodeContentState();
}

class __LoginModalCodeContentState extends State<_LoginModalCodeContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size.height * 0.63, // Fixed height
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
              // Added SingleChildScrollView here
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 40,
                    height: 3,
                    decoration: BoxDecoration(
                      color: AppColors.silverGrayMedium,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Validar código",
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Ingresa el código para confirmarlo",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.slateCoolGray,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: 16),
                  CustomTextInput(
                    hintText: "Número de WhatsApp*",
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 16),
                  CustomTextInput(
                    hintText: "Correo electrónico*",
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 16),
                  CustomTextInput(
                    hintText: "Ingresa código de 6 dígitos**",
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(widget.size.width * 0.9, 40),
                      backgroundColor: AppColors.orangeBrand,
                      elevation: 0,
                    ),
                    child: const Text(
                      "Validar código",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 14.0,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 16.0,
                    ), // Add padding here
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const InicioSesion(),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero, // Remove internal padding
                        minimumSize: Size.zero, // Remove minimum size
                        tapTargetSize:
                            MaterialTapTargetSize
                                .shrinkWrap, // Ajustar área sensible al toque
                      ),
                      child: const Text(
                        "Usar otro método de verificación",
                        style: TextStyle(
                          color: AppColors.slateCoolGray,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      // TODO: Implement resend code
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero, // Eliminar padding interno
                      minimumSize: Size.zero, // Eliminar tamaño mínimo
                      tapTargetSize:
                          MaterialTapTargetSize
                              .shrinkWrap, // Ajustar área sensible al toque
                    ),
                    child: const Text(
                      "Reenviar código",
                      style: TextStyle(
                        color: AppColors.black,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16), // Add spacing below the button
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
