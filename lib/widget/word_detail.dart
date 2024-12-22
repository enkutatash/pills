import 'package:flutter/material.dart';
import 'package:pills/models/word_entity.dart';
import 'package:pills/widget/description_display.dart';

class WordDetail extends StatelessWidget {
  final WordEntity wordEntity;
  const WordDetail({super.key, required this.wordEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 231, 230, 230),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Row(
                children: [
                  Text(
                    wordEntity.word,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.volume_up_outlined))
                ],
              ),
              Text(
                wordEntity.pronunciation,
                style: TextStyle(
                    fontSize: 16, color: Colors.black.withOpacity(0.4)),
              ),
              DescriptionDisplay(
                text: wordEntity.meaning,
              ),
            ],
          ),
          Positioned(
            top: 10,
            right: 10,
            child: IconButton(
                onPressed: () {},
                icon:
                    Icon(Icons.bookmark_border, color: Colors.blue, size: 30)),
          )
        ],
      ),
    );
  }
}
