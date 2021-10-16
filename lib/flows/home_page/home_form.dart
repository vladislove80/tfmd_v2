import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tfmd_v2/flows/home_page/cubit/home_cubit.dart';
import 'package:tfmd_v2/flows/home_page/cubit/home_state.dart';
import 'package:tfmd_v2/flows/home_page/widget/day_item.dart';

class HomeForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: BlocListener<HomeCubit, HomeState>(
        listener: (ctx, state) {},
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (ctx, state) {
            var dateRange = state.model?.getDateRange();
            return Scaffold(
              backgroundColor: Colors.grey[400],
              appBar: AppBar(
                backgroundColor: Colors.grey[400],
                centerTitle: false,
                toolbarHeight: 80,
                // elevation: 19,
                leading: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: CupertinoButton(
                    child: Icon(
                      Icons.my_location,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    onPressed: () {},
                  ),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.model?.city ?? '',
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                            color: Theme.of(context).primaryColorDark,
                          ),
                    ),
                    if (dateRange != null) const SizedBox(height: 6),
                    if (dateRange != null)
                      Text(
                        '$dateRange',
                        style: Theme.of(context).textTheme.caption?.copyWith(
                              color: Theme.of(context)
                                  .primaryColorDark
                                  .withOpacity(0.7),
                            ),
                      ),
                  ],
                ),
                actions: [
                  Icon(
                    Icons.menu_rounded,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  const SizedBox(width: 30)
                ],
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    children: [
                      ...state.model?.dayForecast
                              ?.map(
                                (forecast) => Column(
                                  children: [
                                    const SizedBox(height: 12),
                                    DayItem(forecast),
                                  ],
                                ),
                              )
                              .toList() ??
                          []
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
