import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart_app/features/home/domain/use_case/get_categories_use_case.dart';

import '../../data/models/category_model.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.getAllCategoriesUseCase) : super(HomeInitialState());
  GetAllCategoriesUseCase getAllCategoriesUseCase;
  List<Category>? categories ;

  void getCategories() async {
    emit(GetCategoriesLoadingState());
    try {
      var response = await getAllCategoriesUseCase.call();
      response.fold((l) => emit(GetCategoriesSErrorState(l.errorMessage)), (r){
categories = (r.data??[]).cast<Category>();
        emit(GetCategoriesSuccessState(r));
      });
    } catch (e) {
      emit(GetCategoriesSErrorState(e.toString()));
    }
  }
}
