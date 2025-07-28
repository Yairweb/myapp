import 'package:flutter/material.dart';
import 'package:myapp/src/theme/colors.dart';

class CounterPromotion extends StatefulWidget {
  const CounterPromotion({super.key});

  @override
  CounterPromotionState createState() => CounterPromotionState();
}

class CounterPromotionState extends State<CounterPromotion>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final ScrollController _scrollController = ScrollController();

  // Define the default duration for one animation cycle
  static const Duration _defaultAnimationDuration = Duration(seconds: 20);

  // Define the text for the RichText
  final String promoText =
      '🛟 Hasta 35% de descuento en productos seleccionados. Válido del 24 al 28 de julio de 2025. ';
  final String termsText = '*Consulta términos y condiciones.';

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: _defaultAnimationDuration, // Use the default duration
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    _controller.repeat(); // Loop the animation indefinitely

    // Add a listener to the animation to update the scroll offset
    _animation.addListener(() {
      // Calculate the maximum scroll offset
      final maxScroll = _scrollController.position.maxScrollExtent;
      // Calculate the current scroll offset based on the animation value
      final currentScroll = maxScroll * _animation.value;
      // Update the scroll offset
      _scrollController.jumpTo(currentScroll);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 4.0),
      height: 40.0, // Asignar altura de 40px
      color: AppColors.darkGray, // Background color #3D3D3D
      child: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              child: RichText(
                overflow:
                    TextOverflow
                        .ellipsis, // This might not be needed with SingleChildScrollView
                text: TextSpan(
                  style: TextStyle(color: Colors.white, fontSize: 14.0),
                  children: <TextSpan>[
                    TextSpan(text: promoText),
                    TextSpan(
                      text: termsText,
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 8.0), // Add a gap of 8 pixels
          Container(
            width: 150, // Adjust width as needed
            height: 32, // Adjust height as needed to fit within the row
            decoration: BoxDecoration(
              color: AppColors.orangeBrand, // Orange background color
              borderRadius: BorderRadius.circular(8.0), // Rounded corners
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 4.0,
              ), // Add padding
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center content vertically
                children: [
                  const Text(
                    '1 . 14 . 25 . 20', // Static text
                    style: TextStyle(
                      color: Colors.white, // White text color
                      fontSize: 16.0, // Adjust font size as needed
                      fontWeight: FontWeight.bold, // Bold font weight
                    ),
                  ),
                  const Text(
                    'Días   Hs   Min   Seg', // Static text for labels
                    style: TextStyle(
                      color: Colors.white, // White text color
                      fontSize: 10.0, // Adjust font size as needed
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
