import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myapp/src/utils/buttom_modal_login.dart';
import 'package:myapp/src/utils/buttom_modal_wha.dart';
import 'package:myapp/src/utils/buttom_modal_register.dart';
import 'package:myapp/src/theme/colors.dart';

class InicioSesion extends StatelessWidget {
  const InicioSesion({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 10,
            bottom: 10,
          ),
          width: size.width,
          height: size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 0.30, 0.50, 1.0],
              colors: [
                Color.fromARGB(255, 240, 234, 218),
                Color.fromARGB(239, 242, 232, 213),
                Colors.white,
                Colors.white,
              ],
            ),
          ),

          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SafeArea(
                    bottom: false,
                    child: SizedBox(
                      width: size.width,
                      height: size.height * 0.04,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: AppColors.black,
                            size: 15.0,
                          ),
                          SizedBox(width: 3.0),
                          Text(
                            "Regresar",
                            style: TextStyle(
                              fontSize: size.height * 0.02,
                              fontFamily: "Inter",
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          'assets/svg/logomayoreo.svg',
                          width: size.width,
                          height: size.height * 0.05,
                        ),
                        const SizedBox(height: 30),
                        Image.asset(
                          'assets/img/Products.png',
                          width: size.width / 1.2,
                        ),
                      ],
                    ),
                  ),

                  Container(
                    width: size.width,
                    height: size.height * 0.45,
                    color: Colors.transparent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          // Add a style property to the Text widget. The style should be a TextStyle with a fontSize of size.height * 0.025, fontWeight of FontWeight.bold, and color of Colors.black.
                          "Elige un método de confirmación",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: size.height * 0.025,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w700,
                            color: AppColors.black,
                          ),
                        ),
                        const Text(
                          "Te verificaremos con el método que elijas",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            // Agrega const aquí también
                            fontFamily: 'Inter',
                            fontSize: 14.0,
                            color: AppColors.slateCoolGray,
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(size.width * 0.9, 40),
                            elevation: 0, // Fixed width
                            backgroundColor: Colors.transparent,
                            side: const BorderSide(
                              color: AppColors.slateCoolGray,
                              width: .5,
                            ),
                            shadowColor: Colors.transparent,
                          ),
                          onPressed: () {
                            showModalLogin(context, size);
                          },
                          icon: SvgPicture.asset(
                            'assets/svg/email.svg',
                            width: 20,
                            height: 20,
                          ), // Replace with your actual SVG phone icon asset
                          label: Text(
                            "Continuar con tu email",
                            style: TextStyle(
                              color: AppColors.black,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(size.width * 0.9, 40),
                            elevation: 0, // Fixed width
                            backgroundColor: Colors.transparent,
                            side: const BorderSide(
                              color: AppColors.slateCoolGray,
                              width: .5,
                            ),
                            shadowColor: Colors.transparent, // Black border
                          ),
                          onPressed: () {
                            showModalLoginWha(context, size);
                          },
                          icon: SvgPicture.asset(
                            'assets/svg/whatsapp.svg',
                            width: 20,
                            height: 20,
                          ), // Replace with your actual SVG phone icon asset
                          label: const Text(
                            "Continuar con Whatsapp",
                            style: TextStyle(
                              color: AppColors.black,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(size.width * 0.9, 40),
                            elevation: 0, // Fixed width
                            backgroundColor: Colors.transparent,
                            side: const BorderSide(
                              color: AppColors.slateCoolGray,
                              width: .5,
                            ),
                            shadowColor: Colors.transparent, // Black border
                          ),
                          onPressed: () {
                         
                          },
                          icon: SvgPicture.asset(
                            'assets/svg/apple.svg',
                            width: 20,
                            height: 20,
                          ), // Replace with your actual SVG phone icon asset
                          label: const Text(
                            "Continuar con Apple",
                            style: TextStyle(
                              color: AppColors.black,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "¿Aún no eres miembro mayorista?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.warmGray,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w300,
                            fontSize: 13,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            showModalLoginRegister(context, size);
                          },
                          child: Text(
                            "Registrate ahora",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.warmGray,
                              fontFamily: "Inter",
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    width: size.width,
                    height: size.height * 0.08,
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(
                          'assets/svg/Logovertical.svg',
                          width: 30,
                          height: 30,
                        ),
                        const Text(
                          "©️ B Life®️ 2025",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.darkGray,
                            fontSize: 10,
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ), // body
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
