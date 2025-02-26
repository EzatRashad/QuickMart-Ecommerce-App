import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart_app/features/home/domain/use_case/get_brands_use_case.dart';
import '../../data/models/category_model.dart';
import 'brands_states.dart';


class BrandsCubit extends Cubit<BrandsStates> {
  BrandsCubit(this.getBrandsUseCase)
      : super(GetBrandsInitialState());
  GetBrandsUseCase getBrandsUseCase;

  List<Category>? brandsList;


  void getBrands() async {
    emit(GetBrandsLoadingState());
    try {
      var brands = await getBrandsUseCase.call();
      brands.fold((l) => emit(GetBrandsSErrorState(l.errorMessage)), (r) {
        brandsList = (r.data ?? []).cast<Category>();
        emit(GetBrandsSuccessState(r));
      });
    } catch (e) {
      emit(GetBrandsSErrorState(e.toString()));
    }
  }
}
