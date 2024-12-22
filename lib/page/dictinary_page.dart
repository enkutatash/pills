import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pills/bloc/pills_bloc.dart';
import 'package:pills/dummydata.dart';
import 'package:pills/models/word_entity.dart';
import 'package:pills/widget/search_field.dart';
import 'package:pills/widget/word_display.dart';

class DictinaryPage extends StatelessWidget {
  const DictinaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(8),
          child: SearchField(),
        ),
        BlocBuilder<PillsBloc,PillsState>(builder: (context,state){
          if(state.status == PillsStatus.loading){
            return const Center(child: CircularProgressIndicator());
          }else if(state.status == PillsStatus.wordsFetched){
            return Expanded(
              child: ListView.builder(
                itemCount: state.words.length,
                itemBuilder: (context,index){
                  return WordDisplay(wordEntity: state.words[index]);
                },
              ),
            );
          }else{
            return const Center(child: Text("Failed to fetch data"));
          }
        })
      ],
    );
  }
}
