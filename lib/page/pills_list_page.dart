import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pills/dummydata.dart';
import 'package:pills/widget/pills_widget.dart';
import 'package:pills/widget/search_field.dart';

class PillsListPage extends StatelessWidget {
  final String pillsCategory;
  const PillsListPage({super.key, required this.pillsCategory});

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
            itemCount: pillsData.length,
            itemBuilder: (context, index) {
              return PillsWidget(pillsModel: pillsData[index]);
            },
          ),
        ),
      ],
    );
  }
}
