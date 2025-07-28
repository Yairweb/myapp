import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:myapp/src/inicio_sesion.dart';
import 'package:myapp/src/theme/colors.dart';
import 'package:myapp/src/Widgets/custom_text_input.dart';

Future<dynamic> showModalLoginWha(BuildContext context, Size size) {
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
          child: _LoginModalWhaContent(
            size: size,
          ), // Use the new StatefulWidget
        ),
      );
    },
  );
}

class _LoginModalWhaContent extends StatefulWidget {
  final Size size;

  const _LoginModalWhaContent({required this.size});

  @override
  __LoginModalWhaContentState createState() => __LoginModalWhaContentState();
}

class __LoginModalWhaContentState extends State<_LoginModalWhaContent> {
  bool _codigoEnviado = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height:
          _codigoEnviado ? widget.size.height * 0.54 : widget.size.height * 0.4,
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
                  if (!_codigoEnviado)
                    Text(
                      "Ingresa tu número de WhatsApp",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w700,
                        color: AppColors.black,
                      ),
                    )
                  else
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
                  if (!_codigoEnviado)
                    const Text(
                      "Te enviaremos un código para confirmarlo",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.slateCoolGray,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w300,
                      ),
                    )
                  else
                    const Text(
                      "Ingresa el código para confirmarlo",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w300,
                        color: AppColors.slateCoolGray,
                      ),
                    ),
                  const SizedBox(height: 16),
                  CustomTextInput(
                    hintText: "Número de WhatsApp*",
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 16),
                  if (!_codigoEnviado) // Show button only if code is not sent
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _codigoEnviado = true;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(widget.size.width * 0.9, 40),
                        backgroundColor: AppColors.orangeBrand,
                        elevation: 0,
                      ),
                      child: const Text(
                        "Enviar código",
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 14.0,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  if (_codigoEnviado) // Show code input and validate button if code is sent
                    Column(
                      children: [
                        CustomTextInput(
                          hintText: "Ingresa código de 6 dígitos**",
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          // TODO: Implement validate code
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(widget.size.width * 0.9, 40),
                            backgroundColor: AppColors.orangeBrand,
                            elevation: 0,
                          ),
                          child: const Text(
                            "Validar código",
                            style: TextStyle(color: AppColors.white),
                          ),
                        ),
                        const SizedBox(height: 16), // Add spacing here
                        TextButton(
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
                        const SizedBox(height: 10),
                        TextButton(
                          onPressed: () {
                            // TODO: Implement resend code
                          },
                          style: TextButton.styleFrom(
                            padding:
                                EdgeInsets.zero, // Eliminar padding interno
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
                      ],
                    ),
                  // This TextButton will always be visible below the email field
                  if (!_codigoEnviado) // Only show if code is not sent
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
