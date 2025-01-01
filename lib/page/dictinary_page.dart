import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pills/bloc/WordEvent.dart';
import 'package:pills/bloc/word_bloc.dart';
import 'package:pills/bloc/word_state.dart';
import 'package:pills/widget/word_display.dart';

class DictinaryPage extends StatelessWidget {
  const DictinaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<WordBloc>().add(const FetchWordEvent());
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            "",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        BlocBuilder<WordBloc,WordState>(builder: (context , state) {
          if(state.status == WordStates.loading) {
              return const Center(child: CircularProgressIndicator());
          }else if(state.status == WordStates.success) {
            final wordData = state.words;
            wordData.sort((a , b) => a.word.compareTo(b.word));
              return Expanded(
              child: ListView.builder(
              itemCount: wordData.length,
              itemBuilder: (context, index) {
                return WordDisplay(
                  wordEntity: wordData[index],
                );
              })
            );
          }else {
            // print([state.words, state.status]);
            return const Center(child: Text("failed to fetch data"),
            );
          }
        }),

      ],
    );
  }
}
