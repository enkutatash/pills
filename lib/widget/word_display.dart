import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pills/models/word_entity.dart';

// ignore: must_be_immutable
class WordDisplay extends StatelessWidget {
  WordEntity wordEntity;
  WordDisplay({super.key, required this.wordEntity});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: (){
        context.push("/word_detail/${wordEntity.word}",extra: wordEntity);
      },
      child: Container(
        margin:const EdgeInsets.all(10),
        height: height * 0.1,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Text(wordEntity.word,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
              const Spacer(),
              const Icon(
                Icons.bookmark_border_outlined,
                color: Colors.blue,
                size: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
