import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_mart_app/features/home/presentation/view/home_view.dart';
import 'package:quick_mart_app/features/my_cart/presentation/views/my_cart_view.dart';
import 'package:quick_mart_app/features/wish_list/presentation/views/wish_list_view.dart';

import 'layout_states.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitialState());
  int selectedIndex = 0;
  List<Widget> screens = [
    HomeView(),
    MyCartView(),
    WishListView(),
  ];

  void changeIndex(int index) {
    selectedIndex = index;
    emit(LayoutChangeIndexState());
  }
}
