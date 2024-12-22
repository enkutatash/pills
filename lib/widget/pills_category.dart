import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PillsCategory extends StatelessWidget {
  final String pillsCategory;
  final String imageUrl;
  const PillsCategory(
      {super.key, required this.pillsCategory, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    double widthOfScreen = MediaQuery.of(context).size.width;
    double heightOfScreen = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: () => context.push(
        "/pills_category/$pillsCategory",
      ),
      child: Container(
        width: widthOfScreen * 0.4,
        height: heightOfScreen * 0.4,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    imageUrl,
                    width: double.infinity,
                    height: heightOfScreen * 0.17,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Rating Section

            const SizedBox(height: 4),
            // Name and Add Icon Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Food Name
                  Expanded(
                    child: Text(
                      pillsCategory,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis, // Prevent overflow
                      ),
                    ),
                  ),
                  // Add Button
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
