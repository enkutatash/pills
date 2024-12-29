import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pills/bloc/pills_bloc.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    double widthOfScreen = MediaQuery.of(context).size.width;
    double heightOfScreen = MediaQuery.of(context).size.height;
    return Container(
      width: 0.85 * widthOfScreen,
      height: 0.06 * heightOfScreen,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: TextField(
      focusNode: FocusNode(),
      onChanged: (query) {
        if (query.isEmpty) {
          context.read<PillsBloc>().add(const FetchPillsEvent(category: "Antibiotics"));
        } else {
          context.read<PillsBloc>().add(SearchPillsEvent(query: query));
        }
      },
          decoration: InputDecoration(
          prefixIcon: Icon(CupertinoIcons.search),
          hintText: "Type here to search",
          hintStyle: TextStyle(color: Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(color: Colors.grey),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
      ),
    );
  }
}
