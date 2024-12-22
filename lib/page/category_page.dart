import 'package:flutter/material.dart';
import 'package:pills/dummydata.dart';
import 'package:pills/widget/pills_widget.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return PillsWidget(pillsModel: pillsData[index],);
      },
    );
  }
}