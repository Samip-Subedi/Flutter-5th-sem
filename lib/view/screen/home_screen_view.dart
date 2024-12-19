import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Upanetra',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreenView(),
    );
  }
}

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({super.key});

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  int _selectedIndex = 0;

  static final List<Widget> _categoryScreens = <Widget>[
    const CategoryScreen(categoryName: 'Men'),
    const CategoryScreen(categoryName: 'Women'),
    const CategoryScreen(categoryName: 'Sports'),
    const CategoryScreen(categoryName: 'Kids'),
    const CategoryScreen(categoryName: 'Reading'),
    const CategoryScreen(categoryName: 'Sunglasses'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upanetra', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Colors.black,
        actions: [
          IconButton(icon: const Icon(Icons.search, color: Colors.white), onPressed: () {}),
          IconButton(icon: const Icon(Icons.shopping_cart, color: Colors.white), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network('https://images.unsplash.com/photo-1542349665-d798e802227b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%D&auto=format&fit=crop&w=1974&q=80', height: 250, width: double.infinity, fit: BoxFit.cover),
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.black.withOpacity(0.5)],
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Find Your Perfect Vision',
                      style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Categories', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  final isSelected = index == _selectedIndex;
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: isSelected ? Colors.amber[800] : Colors.grey[200],
                            radius: 30,
                            child: Icon(category.icon, size: 30, color: isSelected ? Colors.white : Colors.black),
                          ),
                          const SizedBox(height: 5),
                          Text(category.title),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Featured Products', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            _selectedIndex == 0
                ? GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 0.7,
                    ),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return FeaturedProductCard(index);
                    },
                  )
                : _categoryScreens[_selectedIndex - 1],
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class Category {
  final String title;
  final IconData icon;

  const Category({required this.title, required this.icon});
}

final List<Category> categories = [
  Category(title: 'Men', icon: Icons.male),
  Category(title: 'Women', icon: Icons.female),
  Category(title: 'Sports', icon: Icons.directions_run),
  Category(title: 'Kids', icon: Icons.child_friendly),
  Category(title: 'Reading', icon: Icons.menu_book),
  Category(title: 'Sunglasses', icon: Icons.wb_sunny),
];

class FeaturedProductCard extends StatelessWidget {
  final int index;

  const FeaturedProductCard(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network('https://via.placeholder.com/200', fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Product $index', style: const TextStyle(fontWeight: FontWeight.bold)),
                const Text('\$100', style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryScreen extends StatelessWidget {
  final String categoryName;
  const CategoryScreen({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Category: $categoryName'),
    );
  }
}