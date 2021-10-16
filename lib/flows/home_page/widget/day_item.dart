import 'package:flutter/material.dart';
import 'package:tfmd_v2/common/app_string.dart';
import 'package:tfmd_v2/common/app_url.dart';
import 'package:tfmd_v2/flows/home_page/model/forecast_type.dart';
import 'package:tfmd_v2/flows/home_page/model/home_model.dart';
import 'package:tfmd_v2/flows/home_page/widget/additional_day_item.dart';

class DayItem extends StatefulWidget {
  final DayForecastModel? forecast;
  final ForecastType forecastType;

  DayItem(this.forecast, this.forecastType);

  @override
  _DayItemState createState() => _DayItemState();
}

class _DayItemState extends State<DayItem> {
  bool _isOpen = false;

  @override
  Widget build(BuildContext context) {
    final weatherIcon = widget.forecast?.weatherIcon;
    final textStyle = TextStyle(color: Theme.of(context).primaryColorDark);
    return InkWell(
      onTap: () {
        setState(() {
          _isOpen = !_isOpen;
        });
      },
      child: Container(
        color: Colors.deepPurple.withOpacity(0.1),
        child: Column(
          children: [
            Container(
              padding:
                  EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        widget.forecast?.getDateLabel(widget.forecastType) ??
                            '',
                        style: TextStyle(
                          color: Theme.of(context)
                              .primaryColorDark
                              .withOpacity(0.7),
                        ),
                      ),
                      const SizedBox(width: 10),
                      if (weatherIcon != null)
                        Container(
                          height: 40,
                          width: 40,
                          child: Image.network(
                            AppUrl.getWeatherIconUrl(weatherIcon),
                          ),
                        ),
                      //Image.network(icon),
                      const SizedBox(width: 10),
                      RichText(
                        text: TextSpan(
                          text: '${widget.forecast?.day}${AppString.celsius}',
                          style: textStyle.copyWith(fontSize: 21),
                          children: [
                            if (widget.forecast?.night != null)
                              TextSpan(
                                text:
                                    '/${widget.forecast?.night}${AppString.celsius}',
                                style: textStyle.copyWith(fontSize: 14),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.water,
                        color: Colors.deepPurple[900],
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${widget.forecast?.humidity}%',
                        style: textStyle,
                      ),
                      const SizedBox(width: 20),
                      Icon(
                        _isOpen ? Icons.arrow_drop_down : Icons.arrow_right,
                        color: Colors.deepPurple[900],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (_isOpen && widget.forecast != null)
              AdditionalDayItem(widget.forecast!),
          ],
        ),
      ),
    );
  }
}
