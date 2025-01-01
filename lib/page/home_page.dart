import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pills/bloc/category_bloc.dart';
import 'package:pills/bloc/category_event.dart';
import 'package:pills/bloc/category_state.dart';
import 'package:pills/widget/pills_category.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CategoryBloc>().add(const FetchCategoryEvent());
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
        BlocBuilder<CategoryBloc , CategoryState>(builder: (context , state) {
          if(state.status == CategoryStatus.loading) {
            return const Center(child: CircularProgressIndicator(),);
          }else if(state.status == CategoryStatus.success) {

            return Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1,
                ),
                itemCount: state.categories.length,
                itemBuilder: (context, index) {
                  return PillsCategory(
                    pillsCategory: state.categories[index].name,
                    imageUrl: "assets/antibiotics.jpg",
              );
            },
          ),
        );}else {
            return const Center(child: Text("Failed to fetch data"));
        }

        }), 

      ],
    );
  }
}
