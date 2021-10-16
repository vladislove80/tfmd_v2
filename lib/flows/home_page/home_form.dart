import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tfmd_v2/common/app_string.dart';
import 'package:tfmd_v2/flows/home_page/cubit/home_cubit.dart';
import 'package:tfmd_v2/flows/home_page/cubit/home_state.dart';
import 'package:tfmd_v2/flows/home_page/model/forecast_type.dart';
import 'package:tfmd_v2/flows/home_page/widget/day_item.dart';

class HomeForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: BlocListener<HomeCubit, HomeState>(
        listener: (ctx, state) {
          if (state.errorMessage != null) {
            //todo show error
          }
        },
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (ctx, state) {
            var dateRange = state.model?.getDateRange();
            var primaryColorDark = Theme.of(context).primaryColorDark;
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
                      color: primaryColorDark,
                    ),
                    onPressed: () {
                      //todo change location
                    },
                  ),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.model?.city ?? '',
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                            color: primaryColorDark,
                          ),
                    ),
                    if (dateRange != null) const SizedBox(height: 6),
                    if (dateRange != null)
                      Text(
                        '$dateRange',
                        style: Theme.of(context).textTheme.caption?.copyWith(
                              color: primaryColorDark.withOpacity(0.7),
                            ),
                      ),
                  ],
                ),
                actions: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DropdownButton<ForecastType>(
                        value: state.type,
                        style: TextStyle(color: Colors.green),
                        iconEnabledColor: primaryColorDark,
                        items: [
                          ForecastType.DAYS_FORECAST,
                          ForecastType.HOUR_FORECAST,
                        ].map<DropdownMenuItem<ForecastType>>(
                          (ForecastType value) {
                            return DropdownMenuItem<ForecastType>(
                              value: value,
                              child: Text(
                                value.label,
                                style: TextStyle(color: primaryColorDark),
                              ),
                            );
                          },
                        ).toList(),
                        onChanged: (value) {
                          if (value != null)
                            BlocProvider.of<HomeCubit>(context)
                                .switchForecastType(value);
                        },
                      ),
                      const SizedBox(width: 20),
                      //todo menu for sign in, theme changing
                      Icon(
                        Icons.menu_rounded,
                        color: primaryColorDark,
                      ),
                      const SizedBox(width: 30),
                    ],
                  )
                ],
              ),
              body: SingleChildScrollView(
                child: Stack(
                  children: [
                    if (state.model?.dayForecast?.isNotEmpty ?? false)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          children: [
                            ...state.model?.dayForecast
                                    ?.map(
                                      (forecast) => Column(
                                        children: [
                                          const SizedBox(height: 12),
                                          DayItem(forecast, state.type),
                                        ],
                                      ),
                                    )
                                    .toList() ??
                                []
                          ],
                        ),
                      ),
                    if (state.model?.dayForecast?.isEmpty ?? false)
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: Center(
                          child: Text(AppString.forecastIsEmpty),
                        ),
                      ),
                    if (state.isLoading)
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
