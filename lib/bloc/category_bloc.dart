
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:pills/bloc/category_event.dart';
import 'package:pills/bloc/category_state.dart';
import 'package:pills/logic/repository.dart';

class CategoryBloc extends Bloc<CategoryEvent , CategoryState> {
    final Repository repository;

    CategoryBloc({required this.repository}) : super(const CategoryState()) {
        on<FetchCategoryEvent>(_fetchCategories);
    }

    FutureOr<void> _fetchCategories(FetchCategoryEvent event , Emitter<CategoryState>emit) async {
      try {
        final categories = await repository.fetchCategory();
        emit(state.copyWith(status: CategoryStatus.success , categories: categories));
      }catch (e) {
        emit(state.copyWith(status: CategoryStatus.failure));
        throw Exception(e);
      }
    }
}