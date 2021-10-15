import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tfmd_v2/flows/home_page/cubit/home_cubit.dart';
import 'package:tfmd_v2/flows/home_page/home_form.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (_) => HomeCubit()..init(),
      child: HomeForm(),
    );
  }
}
