import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:pills/models/pills_model.dart';

const List<TabItem> items = [
  TabItem(
    icon: CupertinoIcons.home,
    title: 'Home',
  ),
  TabItem(
    icon: CupertinoIcons.bookmark,
    title: 'Bookmarks',
  ),
  TabItem(
    icon: CupertinoIcons.book,
    title: 'Dictionary',
  ),
];

class MainPage extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const MainPage({super.key, required this.navigationShell});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int visit = 0;

  @override
  Widget build(BuildContext context) {
    // Dynamically update the title based on the current route
    final currentRoute =
        GoRouter.of(context).routeInformationProvider.value.uri;
    String title = _getTitleForRoute(currentRoute.toString());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.5,
        shadowColor: Theme.of(context).shadowColor,
        backgroundColor: Colors.blue,
        leadingWidth: double.infinity,
        leading: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                CupertinoIcons.line_horizontal_3_decrease,
                size: 35,
                color: Colors.white,
              ),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Icon(
                CupertinoIcons.person,
                size: 35,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
      body: widget.navigationShell,
      bottomNavigationBar: BottomBarDefault(
        items: items,
        backgroundColor: Colors.white,
        iconSize: 20,
        titleStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, -1),
          ),
        ],
        color: Colors.grey,
        colorSelected: Colors.blue,
        indexSelected: visit,
        onTap: (int index) => setState(() {
          

          if (visit == index) {
            widget.navigationShell.goBranch(index, initialLocation: true);
          } else {
            setState(() {
              visit = index;
            });
            widget.navigationShell.goBranch(index, initialLocation: true);
          }
        }),
      ),
    );
  }

  // Function to determine the title based on the current route
  String _getTitleForRoute(String route) {
    print("route " + route);
    // print("state " + extra.toString());
    if (route.startsWith('/home_page')) {
      return 'Home';
    } else if (route.startsWith('/book_marks')) {
      return 'Bookmarks';
    } else if (route.startsWith('/dictionary_page')) {
      return 'Dictionary';
    } else if (route.startsWith('/pills_category')) {
      // Extract category for Pills Category route
      final category = route.split('/').last;
      return '${category[0].toUpperCase()}${category.substring(1)}';
    } else if (route.startsWith('/pills_detail')) {
      final pill = Uri.decodeComponent(route.split('/').last);
      final firstWord = pill.split(' ').first;
      return '${firstWord[0].toUpperCase()}${firstWord.substring(1)}';
    } else if (route.startsWith('/word_detail')) {
      final pill = Uri.decodeComponent(route.split('/').last);
      final firstWord = pill.split(' ').first;
      return '${firstWord[0].toUpperCase()}${firstWord.substring(1)}';
    }

    return 'App';
  }
}
