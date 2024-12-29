import 'package:flutter/material.dart';
import 'package:pills/dummydata.dart';
import 'package:pills/widget/word_display.dart';

class DictinaryPage extends StatelessWidget {
  const DictinaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            "Dictionary",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
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
