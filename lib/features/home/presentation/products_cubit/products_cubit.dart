import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart_app/features/home/domain/use_case/add_to_cart_use_case.dart';
import 'package:quick_mart_app/features/home/presentation/products_cubit/products_states.dart';

import '../../data/models/ProductResponseModel.dart';
import '../../domain/use_case/get_products_use_case.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(
      {required this.getProductsUseCase, required this.addToCartUseCase})
      : super(ProductsInitialState());

  static ProductsCubit get(context) => BlocProvider.of(context);
  List<Product>? productsList;
  GetProductsUseCase getProductsUseCase;
  AddToCartUseCase addToCartUseCase;

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

  int numOfCartItems = 0;
  void addToCart(String productId) async {
    emit(AddToCartLoadingState());
    try {
      var result = await addToCartUseCase.call(productId);
      result.fold((l) => emit(AddToCartErrorState(l.errorMessage)), (r) {
        numOfCartItems = r.numOfCartItems?? 0;
        print('numOfCartItems: $numOfCartItems');
        emit(AddToCartSuccessState(r));
      });
    } catch (e) {
      emit(AddToCartErrorState(e.toString()));
    }
  }
  
  
}
