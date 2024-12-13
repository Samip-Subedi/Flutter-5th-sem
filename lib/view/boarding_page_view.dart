import 'package:flutter/material.dart';

class BoardingPageView extends StatelessWidget {
  const BoardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF81C784), Color(0xFF388E3C)], // Light and dark green
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Sunglasses Icon
                // Icon(
                //   Icons.sunglass,
                //   size: 150,
                //   color: Colors.white,
                // ),
                const SizedBox(height: 30),

                // Heading
                const Text(
                  'Welcome to Upanetra!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),

                // Fun Fact about Eyewear
                const Text(
                  'Discover a stylish collection of eyewear designed for comfort and elegance.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 30),

                // Fun Fact Section
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'Did you know? Eyewear has evolved from basic utility to a modern style statement since the 13th century!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // "Get Started" Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/login'); // Navigate to Login or Dashboard
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        vertical: 14, horizontal: 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 4,
                  ),
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF388E3C), // Button text color
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
