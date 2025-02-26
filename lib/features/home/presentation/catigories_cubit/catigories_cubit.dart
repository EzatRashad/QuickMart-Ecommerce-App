import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart_app/features/home/domain/use_case/get_categories_use_case.dart';

import '../../data/models/category_model.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<CategoriesState> {
  HomeCubit(this.getAllCategoriesUseCase)
      : super(CategoriesInitialState());
  GetAllCategoriesUseCase getAllCategoriesUseCase;
  List<Category>? categoriesList;

  void getCategories() async {
    emit(GetCategoriesLoadingState());
    try {
      var categories = await getAllCategoriesUseCase.call();
      categories.fold((l) => emit(GetCategoriesSErrorState(l.errorMessage)), (r) {
        categoriesList = (r.data ?? []).cast<Category>();
        emit(GetCategoriesSuccessState(r));
      });
    } catch (e) {
      emit(GetCategoriesSErrorState(e.toString()));
    }
  }

}
