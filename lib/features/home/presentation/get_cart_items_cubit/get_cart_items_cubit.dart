import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart_app/features/home/domain/entities/get_cart_response_entity.dart';
import 'package:quick_mart_app/features/home/domain/use_case/get_cart_items_use_case.dart';

import 'get_cart_items_state.dart';

class GetCartItemsCubit extends Cubit<GetCartItemsState> {
  GetCartItemsCubit({required this.getCartItemsUseCase})
      : super(GetCartItemsInitialState());

  static GetCartItemsCubit get(context) => BlocProvider.of(context);

  final GetCartItemsUseCase getCartItemsUseCase;
  List<GetProductsEntity>? itemsList;
  num totalPrice = 0.0;

  Future<void> getCartItems() async {
    emit(GetCartItemsLoadingState());
    try {
      
      final result = await getCartItemsUseCase.call();

      result.fold(
        (failure) => emit(GetCartItemsSErrorState(failure.errorMessage)),
        (response) {
          itemsList = response.data?.products ?? [];
          totalPrice= response.data?.totalCartPrice ?? 0.0;

          emit(GetCartItemsSuccessState(response));
        },
      );
    } catch (e) {
      emit(GetCartItemsSErrorState(e.toString()));
    }
  }
}
