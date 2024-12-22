import 'package:flutter/material.dart';
import 'package:pills/dummydata.dart';
import 'package:pills/models/word_entity.dart';
import 'package:pills/widget/search_field.dart';
import 'package:pills/widget/word_display.dart';

class DictinaryPage extends StatelessWidget {
  const DictinaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(8),
          child: SearchField(),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: wordData.length,
              itemBuilder: (context, index) {
                return WordDisplay(
                  wordEntity: wordData[index],
                );
              }),
        ),
      ],
    );
  }
}
