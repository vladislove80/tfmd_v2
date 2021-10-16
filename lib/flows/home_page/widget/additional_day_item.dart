import 'package:flutter/material.dart';
import 'package:tfmd_v2/common/app_string.dart';
import 'package:tfmd_v2/flows/home_page/model/home_model.dart';
import 'package:tfmd_v2/flows/home_page/widget/two_value_row.dart';

class AdditionalDayItem extends StatelessWidget {
  final DayForecastModel forecast;

  AdditionalDayItem(this.forecast);

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(
      color: Theme.of(context).primaryColorDark.withOpacity(0.7),
    );
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12),
      color: Colors.deepPurple.withOpacity(0.05),
      child: Column(
        children: [
          TwoValueRow(
            firstLabel: AppString.min,
            firstValue: (forecast.min?.toString() ?? '') + AppString.celsius,
            secondLabel: AppString.max,
            secondValue: (forecast.max?.toString() ?? '') + AppString.celsius,
          ),
          const SizedBox(height: 10),
          TwoValueRow(
            firstLabel: AppString.evening,
            firstValue:
                (forecast.evening?.toString() ?? '') + AppString.celsius,
            secondLabel: AppString.morning,
            secondValue:
                (forecast.morning?.toString() ?? '') + AppString.celsius,
          ),
          const SizedBox(height: 10),
          Text(
            '${AppString.speed}${forecast.speed}',
            style: textStyle,
          ),
          if (forecast.rain != null) const SizedBox(height: 10),
          if (forecast.rain != null)
            Text(
              '${AppString.rain}${forecast.rain}',
              style: textStyle,
            ),
          const SizedBox(height: 10),
          if (forecast.weatherMessage != null)
            Text(
              '${AppString.desc}${forecast.weatherMessage}',
              style: textStyle,
            ),
        ],
      ),
    );
  }
}
