import 'package:flutter/material.dart';
import 'package:pills/models/pills_model.dart';
import 'package:pills/widget/description_display.dart';
import 'package:pills/widget/list_display.dart';
import 'package:pills/widget/pills_take.dart';

class PillsDetail extends StatelessWidget {
  final PillsModel pillsModel;

  const PillsDetail({
    super.key,
    required this.pillsModel,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    pillsModel.imageUrl,
                    width: double.infinity,
                    height: height * 0.3,
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.bookmark_border),
                    color: Colors.blue,
                    iconSize: 30,
                  ),
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 48, 110, 50),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text("${pillsModel.category}",
                  style: TextStyle(color: Colors.white)),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              pillsModel.name,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            DescriptionDisplay(
              text: pillsModel.uses,
            ),
            SizedBox(
              height: 10,
            ),
            PillsTake(
              duration: "6/month",
              dose: "2/day",
              frequency: "daily",
            ),
            SizedBox(
              height: 10,
            ),
            ListDisplay(
              text: pillsModel.sideEffect,
              description: "Side Effect",
            ),
          ],
        ),
      ),
    );
  }
}
