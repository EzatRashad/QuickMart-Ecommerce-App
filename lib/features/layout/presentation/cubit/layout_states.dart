 
abstract class LayoutStates {}

class LayoutInitialState extends LayoutStates {}

class LayoutLoadingState extends LayoutStates {}

class LayoutSuccessState extends LayoutStates {
 
}

class LayoutFailureState extends LayoutStates {
  final String error;
  LayoutFailureState(this.error);
}
class LayoutChangeIndexState extends LayoutStates {}
