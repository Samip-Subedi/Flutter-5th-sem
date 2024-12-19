import 'package:flutter/material.dart';

class FavouriteScreenView extends StatelessWidget {
  const FavouriteScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Nothing is in favourite',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
