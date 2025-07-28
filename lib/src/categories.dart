import 'package:flutter/material.dart';
import 'package:myapp/src/Widgets/homeheader.dart'; // Import the new widget
import 'package:myapp/src/Widgets/productsearchbar.dart'; // Import the ProductSearchBar widget
import 'package:myapp/src/Widgets/counterpromotion.dart'; // Import the CounterPromotion widget

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Remove the appBar
      // appBar: const HomeHeader(), // Use the custom widget
      drawer: Drawer(
        // Drawer content goes here
      ),
      body: SafeArea(
        child: Column(
          children: [
            CounterPromotion(), // Add CounterPromotion here
            HomeHeader(), // Add HomeHeader here
            Padding(
              padding: const EdgeInsets.only(
                bottom: 16.0,
              ), // Add padding to the bottom
              child: ProductSearchBar(), // Use the ProductSearchBar widget here
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Categories Section
                      Text(
                        'Explora por categorías',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16.0),
                      // Category Grid Placeholder
                      Container(
                        height:
                            500, // Placeholder height, will be replaced by GridView
                        color: Colors.grey[300],
                        child: Center(child: Text('Category Grid Goes Here')),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: 1, // Set the current index to Categories
        selectedItemColor: Colors.amber[800], // Example selected item color
        unselectedItemColor: Colors.grey, // Example unselected item color
        onTap: (index) {
          // Handle navigation
        },
      ),
    );
  }
}
