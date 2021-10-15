import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tfmd_v2/flows/home_page/cubit/home_cubit.dart';
import 'package:tfmd_v2/flows/home_page/cubit/home_state.dart';

class HomeForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (ctx, state) {},
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (ctx, state) {
          return Scaffold(
            body: Container(
              color: Colors.blueAccent,
              child: Center(
                child: OutlinedButton(
                  child: Text('GO BACK'),
                  onPressed: () {},
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
