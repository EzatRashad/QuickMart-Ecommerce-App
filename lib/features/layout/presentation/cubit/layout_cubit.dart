import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'layout_states.dart';


 
 
class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit():super(LayoutInitialState());
  int selectedIndex=0;
  List<Widget> screens=[
   
  ];
  void changeIndex(int index){
    selectedIndex=index;
    emit(LayoutChangeIndexState());
  }
}