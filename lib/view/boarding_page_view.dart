import 'package:flutter/material.dart';

class BoardingPageView extends StatefulWidget {
  const BoardingPageView({super.key});

  @override
  State<BoardingPageView> createState() => _BoardingPageViewState();
}

class _BoardingPageViewState extends State<BoardingPageView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Onboarding content
  final List<Map<String, String>> _boardingPages = [
    {
      'title': 'Welcome to Upanetra!',
      'description': 'Discover a stylish collection of eyewear designed for comfort and elegance.',
      'image': 'assets/images/onboard.gif',
    },
    {
      'title': 'Trendy Eyewear Styles',
      'description': 'From sunglasses to prescription glasses, explore styles that suit you.',
      'image': 'assets/images/styles.gif',
    },
    {
      'title': 'Elevate Your Look',
      'description': 'Turn your eyewear into a fashion statement with Upanetra.',
      'image': 'assets/images/onboarding.gif',
    },
  ];

  void _onNext() {
    if (_currentPage < _boardingPages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _navigateToLogin();
    }
  }

  void _onPrevious() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _navigateToLogin() {
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // PageView for onboarding screens
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: _boardingPages.length,
            itemBuilder: (context, index) {
              final page = _boardingPages[index];
              return Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Page Heading
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        page['title']!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF388E3C),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Larger Image with padding
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.5, // Larger height
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 15,
                              spreadRadius: 3,
                              offset: const Offset(0, 4),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.asset(
                            page['image']!,
                            fit: BoxFit.cover, // Ensures the image scales well
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Page Description Below Image
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        page['description']!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              );
            },
          ),

          // Skip Button at Top-Right
          Positioned(
            top: 50,
            right: 16,
            child: GestureDetector(
              onTap: _navigateToLogin,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey.shade400, width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 5,
                      spreadRadius: 2,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Text(
                  'Skip',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
          ),

          // Bottom Navigation (Indicators and Next Button)
          Positioned(
            bottom: 30,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Previous Button
                if (_currentPage > 0)
                  IconButton(
                    onPressed: _onPrevious,
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black54,
                      size: 28,
                    ),
                  )
                else
                  const SizedBox(width: 48),

                // Page Indicators
                Row(
                  children: List.generate(
                    _boardingPages.length,
                        (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      height: 12,
                      width: _currentPage == index ? 20 : 12,
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? const Color(0xFF388E3C)
                            : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                ),

                // Next or Check Button
                IconButton(
                  onPressed: _onNext,
                  icon: Icon(
                    _currentPage == _boardingPages.length - 1
                        ? Icons.check_circle
                        : Icons.arrow_forward_ios,
                    color: const Color(0xFF388E3C),
                    size: 28,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
