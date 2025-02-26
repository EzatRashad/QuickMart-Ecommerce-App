import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart_app/features/home/presentation/brands_cubit/brands_states.dart';
import 'package:quick_mart_app/features/home/presentation/products_cubit/products_states.dart';

import '../../data/models/ProductResponseModel.dart';
import '../../domain/use_case/get_products_use_case.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit({required this.getProductsUseCase}) : super(ProductsInitialState());

List<Product>? productsList;
 GetProductsUseCase getProductsUseCase;

  void getProducts() async {
    emit(ProductsLoadingState());
    try {
      var products = await getProductsUseCase.call();
      products.fold((l) => emit(ProductsSErrorState(l.errorMessage)), (r) {
        productsList = (r.data ?? []).cast<Product>();
        emit(ProductsSuccessState(r));
      });
    } catch (e) {
      emit(ProductsSErrorState(e.toString()));
    }
  }
}
