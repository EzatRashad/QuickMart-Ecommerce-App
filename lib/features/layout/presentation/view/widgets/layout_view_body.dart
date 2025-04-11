import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'custom_nav_bar.dart';
import '../../cubit/layout_cubit.dart';
import '../../cubit/layout_states.dart';

class LayoutViewBody extends StatefulWidget {
  const LayoutViewBody({super.key});

  @override
  State<LayoutViewBody> createState() => _LayoutViewBodyState();
}

class _LayoutViewBodyState extends State<LayoutViewBody> {
  LayoutCubit layoutCubit = LayoutCubit();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      bloc: layoutCubit,
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            bottomNavigationBar: CustomNavBar(
              homeCubit: layoutCubit,
            ),
            body: layoutCubit.screens[layoutCubit.selectedIndex]);
      },
    );
  }
}
