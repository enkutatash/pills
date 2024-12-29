import 'package:flutter/material.dart';
import 'package:pills/widget/pills_category.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Categories',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1,
            ),
            itemCount: 1,
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

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:pills/widget/pills_category.dart';
// import 'package:pills/widget/search_field.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   // A list to store categories fetched from Firebase
//   List<String> pillCategories = [];

//   // Fetch categories from Firestore
//   Future<void> fetchPillCategories() async {
//     try {
//       // Fetch categories collection from Firestore
//       QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('catagory').get();
//       List<String> categories = snapshot.docs.map((doc) => doc['name'] as String).toList();

//       // Update the UI by setting the fetched categories
//       setState(() {
//         pillCategories = categories;
//       });
//     } catch (e) {
//       print('Error fetching categories: $e');
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     fetchPillCategories(); // Call the function to fetch categories when the widget is first created
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const Padding(
//           padding: EdgeInsets.all(8.0),
//           child: SearchField(),
//         ),
//         Expanded(
//           child: pillCategories.isEmpty
//               ? const Center(child: CircularProgressIndicator()) // Show a loading spinner until data is fetched
//               : GridView.builder(
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     mainAxisSpacing: 10,
//                     crossAxisSpacing: 10,
//                     childAspectRatio: 1,
//                   ),
//                   itemCount: pillCategories.length, // Set the number of categories based on fetched data
//                   itemBuilder: (context, index) {
//                     String category = pillCategories[index];
//                     return PillsCategory(
//                       pillsCategory: category,
//                       imageUrl: "assets/antibiotics.jpg",// Assuming you have images named based on the category
//                     );
//                   },
//                 ),
//         ),
//       ],
//     );
//   }
// }

