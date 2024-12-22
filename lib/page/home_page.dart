import 'package:flutter/material.dart';
import 'package:pills/widget/pills_category.dart';
import 'package:pills/widget/search_field.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SearchField(),
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1,
            ),
            itemCount: 10,
            itemBuilder: (context, index) {
              return const PillsCategory(
                pillsCategory: "Antibiotics",
                imageUrl: "assets/antibiotics.jpg",
              );
            },
          ),
        ),
      ],
    );
  }
}
