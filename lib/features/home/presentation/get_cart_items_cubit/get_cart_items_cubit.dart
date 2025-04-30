import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart_app/features/home/domain/entities/get_cart_response_entity.dart';
import 'package:quick_mart_app/features/home/domain/use_case/delete_item_from_cart.dart';
import 'package:quick_mart_app/features/home/domain/use_case/get_cart_items_use_case.dart';
import 'package:quick_mart_app/features/home/domain/use_case/update_cart_item_quantity_use_case.dart';

import 'get_cart_items_state.dart';

class GetCartItemsCubit extends Cubit<GetCartItemsState> {
  GetCartItemsCubit(
      this.deleteItemFromCartUseCase, this.updateCartItemQuantityUseCase,
      {required this.getCartItemsUseCase})
      : super(GetCartItemsInitialState());

  static GetCartItemsCubit get(context) => BlocProvider.of(context);

  final GetCartItemsUseCase getCartItemsUseCase;
  final DeleteItemFromCartUseCase deleteItemFromCartUseCase;
  final UpdateCartItemQuantityUseCase updateCartItemQuantityUseCase;
  List<GetProductsEntity>? itemsList;
  num totalPrice = 0.0;
  num numOfCartItems = 0;

  Future<void> getCartItems() async {
    emit(GetCartItemsLoadingState());
    try {
      final result = await getCartItemsUseCase.call();

      result.fold(
        (failure) => emit(GetCartItemsSErrorState(failure.errorMessage)),
        (response) {
          itemsList = response.data?.products ?? [];
          totalPrice = response.data?.totalCartPrice ?? 0.0;
          numOfCartItems = response.numOfCartItems ?? 0;

          emit(GetCartItemsSuccessState(response));
        },
      );
    } catch (e) {
      emit(GetCartItemsSErrorState(e.toString()));
    }
  }

  Future<void> deleteItemFromCart(String productId) async {
    emit(DeleteItemFromCartLoadingState());
    try {
      final result = await deleteItemFromCartUseCase.call(productId);

      result.fold(
        (failure) => emit(DeleteItemFromCartErrorState(failure.errorMessage)),
        (response) {
          itemsList = response.data?.products ?? [];
          totalPrice = response.data?.totalCartPrice ?? 0.0;
          numOfCartItems = response.numOfCartItems ?? 0;
          emit(DeleteItemFromCartSuccessState(response));
        },
      );
    } catch (e) {
      emit(DeleteItemFromCartErrorState(e.toString()));
    }
  }

  Future<void> updateCartItemQuantity(String id, String quantity) async {
    emit(UpdateItemInCartLoadingState());
    try {
      final result = await updateCartItemQuantityUseCase.call(id, quantity);
       result.fold(
        (failure) => emit(UpdateItemInCartErrorState(failure.errorMessage)),
        (response) {
          itemsList = response.data?.products ?? [];
          totalPrice = response.data?.totalCartPrice ?? 0.0;
          numOfCartItems = response.numOfCartItems ?? 0;
          emit(UpdateItemInCartSuccessState(response));
        },
      );
    } catch (e) {
      emit(UpdateItemInCartErrorState(e.toString()));
    }
  }
}
