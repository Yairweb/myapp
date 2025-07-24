import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:myapp/src/inicio_sesion.dart';
import 'package:myapp/src/theme/colors.dart';

Future<dynamic> showModalLogin(BuildContext context, Size size) {
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
          child: _LoginModalContent(size: size), // Use the new StatefulWidget
        ),
      );
    },
  );
}

class _LoginModalContent extends StatefulWidget {
  final Size size;

  const _LoginModalContent({required this.size});

  @override
  __LoginModalContentState createState() => __LoginModalContentState();
}

class __LoginModalContentState extends State<_LoginModalContent> {
  bool _codigoEnviado = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size.height * 0.4, // Fixed height
      decoration: const BoxDecoration(
        color: Colors.white,
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
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(height: 10),
                  if (!_codigoEnviado)
                    Text(
                      "Ingresa tu correo electrónico",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  else
                    Text(
                      "Validar código",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  const SizedBox(height: 5),
                  if (!_codigoEnviado)
                    const Text(
                      "Te enviaremos un código para confirmarlo",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
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
                        color: Colors.grey,
                      ),
                    ),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10.0, // Reduced vertical padding
                        horizontal: 10.0,
                      ),
                      isDense: true, // Make the TextField more dense
                      hintText: "Correo electrónico",
                      hintStyle: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 14.0,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                    ),
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
                        backgroundColor: const Color.fromARGB(
                          255,
                          225,
                          161,
                          65,
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        "Enviar código",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  if (_codigoEnviado) // Show code input and validate button if code is sent
                    Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 10.0,
                            ),
                            isDense: true, // Make the TextField more dense
                            hintText: "Ingresa código de 6 dígitos*",
                            hintStyle: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 14.0,
                              fontWeight: FontWeight.w300,
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          // TODO: Implement validate code
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(widget.size.width * 0.9, 40),
                            backgroundColor: const Color.fromARGB(
                              255,
                              225,
                              161,
                              65,
                            ),
                            elevation: 0,
                          ),
                          child: const Text(
                            "Validar código",
                            style: TextStyle(color: Colors.white),
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
                              color: Colors.grey,
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
                              color: Color.fromARGB(255, 0, 0, 0),
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
                            color: Colors.grey,
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
      height: widget.size.height * 0.4, // Fixed height
      decoration: const BoxDecoration(
        color: Colors.white,
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
                      color: Colors.grey[300],
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
                      ),
                    )
                  else
                    Text(
                      "Validar código",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  const SizedBox(height: 5),
                  if (!_codigoEnviado)
                    const Text(
                      "Te enviaremos un código para confirmarlo",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
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
                        color: Colors.grey,
                      ),
                    ),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10.0, // Reduced vertical padding
                        horizontal: 10.0,
                      ),
                      isDense: true, // Make the TextField more dense
                      hintText: "Número de WhatsApp",
                      hintStyle: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 14.0,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                    ),
                    keyboardType: TextInputType.number,
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
                        backgroundColor: const Color.fromARGB(
                          255,
                          225,
                          161,
                          65,
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        "Enviar código",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  if (_codigoEnviado) // Show code input and validate button if code is sent
                    Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 10.0,
                            ),
                            isDense: true, // Make the TextField more dense
                            hintText: "Ingresa código de 6 dígitos*",
                            hintStyle: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 14.0,
                              fontWeight: FontWeight.w300,
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          // TODO: Implement validate code
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(widget.size.width * 0.9, 40),
                            backgroundColor: const Color.fromARGB(
                              255,
                              225,
                              161,
                              65,
                            ),
                            elevation: 0,
                          ),
                          child: const Text(
                            "Validar código",
                            style: TextStyle(color: Colors.white),
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
                              color: Colors.grey,
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
                              color: Color.fromARGB(255, 0, 0, 0),
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
                            color: Colors.grey,
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
            0.9, // Puedes ajustar la altura según necesites
        decoration: const BoxDecoration(
          color: Colors.white,
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
                    color: Colors.grey[300],
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
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  "Ingresa tu información para crear tu perfil",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w300,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  // controller: _nombreController, // Si usas un controlador
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 10.0,
                    ),
                    isDense: true,
                    hintText: "Nombre(s)*",
                    hintStyle: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 14.0,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 10.0,
                    ),
                    isDense: true,
                    hintText: "Apellido paterno*",
                    hintStyle: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 14.0,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 10.0,
                    ),
                    isDense: true,
                    hintText: "Apellido materno*",
                    hintStyle: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 14.0,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 10.0,
                    ),
                    isDense: true,
                    hintText: "Whatsapp*",
                    hintStyle: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 14.0,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 10.0,
                    ),
                    isDense: true,
                    hintText: "Correo electrónico*",
                    hintStyle: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 14.0,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 10.0,
                    ),
                    isDense: true,
                    hintText: "Empresa (opcional)",
                    hintStyle: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 14.0,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                  ),
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
                              color: Colors.black,
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
                    backgroundColor: const Color.fromARGB(255, 225, 161, 65),
                    elevation: 0,
                  ),
                  child: AnimatedDefaultTextStyle(
                    style: TextStyle(
                      fontSize: 14.0,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w300,
                      color:
                          _aceptaTerminos
                              ? Colors.white
                              : const Color.fromARGB(255, 115, 120, 128),
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
    this.activeColor = Colors.orange, // Default active color
    this.inactiveColor = Colors.white, // Default inactive color
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
                  color: value ? activeColor : Colors.grey, // Border color
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
      height: widget.size.height * 0.65, // Fixed height
      decoration: const BoxDecoration(
        color: Colors.white,
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
                      color: Colors.grey[300],
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
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Ingresa el código para confirmarlo",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10.0, // Reduced vertical padding
                        horizontal: 10.0,
                      ),
                      isDense: true, // Make the TextField more dense
                      hintText: "Número de WhatsApp",
                      hintStyle: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 14.0,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10.0, // Reduced vertical padding
                        horizontal: 10.0,
                      ),
                      isDense: true, // Make the TextField more dense
                      hintText: "Correo electrónico",
                      hintStyle: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 14.0,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 10.0,
                      ),
                      isDense: true, // Make the TextField more dense
                      hintText: "Ingresa código de 6 dígitos*",
                      hintStyle: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 14.0,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                    ),
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
                          color: Colors.grey,
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
                        color: Color.fromARGB(255, 0, 0, 0),
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
