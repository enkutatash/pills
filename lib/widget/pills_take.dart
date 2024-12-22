import 'package:flutter/material.dart';

class PillsTake extends StatelessWidget {
  final String duration;
  final String dose;
  final String frequency;
  const PillsTake(
      {super.key,
      required this.duration,
      required this.dose,
      required this.frequency});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 206, 205, 205),
        borderRadius: BorderRadius.circular(10),
      
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text(
                "Duration",
                style: TextStyle(
                    fontSize: 16, color: Colors.black.withOpacity(0.4)),
              ),
              Text(
                duration,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                "Dose",
                style: TextStyle(
                    fontSize: 16, color: Colors.black.withOpacity(0.4)),
              ),
              Text(
                dose,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                "Frequency",
                style: TextStyle(
                    fontSize: 16, color: Colors.black.withOpacity(0.4)),
              ),
              Text(
                frequency,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
