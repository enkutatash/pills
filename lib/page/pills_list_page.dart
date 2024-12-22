import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pills/bloc/pills_bloc.dart';
import 'package:pills/dummydata.dart';
import 'package:pills/widget/pills_widget.dart';
import 'package:pills/widget/search_field.dart';

class PillsListPage extends StatelessWidget {
  final String pillsCategory;
  const PillsListPage({super.key, required this.pillsCategory});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SearchField(),
        ),
        BlocBuilder<PillsBloc, PillsState>(builder: (context, state) {
          if (state.status == PillsStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }else if (state.status == PillsStatus.success) {
            return Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1,
                ),
                itemCount: state.pills.length,
                itemBuilder: (context, index) {
                  return PillsWidget(pillsModel: state.pills[index]);
                },
              ),
            );
          } else {
            return const Center(child: Text("Failed to fetch data"));
          } 
        })
      ],
    );
  }
}
