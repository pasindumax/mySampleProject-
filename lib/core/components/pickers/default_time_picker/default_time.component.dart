import 'package:pasindu_sample_app/store/theme_store/theme.store.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:provider/provider.dart';
import 'package:finap_base_theme/palette.dart';

class DefaultTimePicker extends StatelessWidget {
  final double? topMargin;
  final String? labelText;
  final TextStyle? labelStyle;
  final TimeOfDay? initialTime;
  final bool? isMandatory;
  final Function(TimeOfDay?)? onTimeSelection;
  final String? validationMessage;
  String? timeText;
  DefaultTimePicker(
      {Key? key,
      this.topMargin,
      this.labelText,
      this.labelStyle,
      this.onTimeSelection,
      this.validationMessage,
      this.isMandatory,
      this.initialTime,
      this.timeText})
      : super(key: key);

  TimeOfDay? time;
  @override
  Widget build(BuildContext context) {
    final ts = Provider.of<ThemeStore>(context);
    timeText = formatTimeOfDay(initialTime ?? TimeOfDay.now());
    //  final DateTimeHelper dateTimeHelper=di();
    return Container(
        child: Column(
      children: [
        _topLabel(context, ts),
        _field(context, ts),
        _errorLabel(context, ts)
      ],
    ));
  }

  Widget _topLabel(BuildContext context, ThemeStore ts) {
    return Container(
      margin: EdgeInsets.only(
        top: topMargin ?? 0,
      ),
      child: Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Text(
                labelText ?? '',
                style:
                    labelStyle ?? Theme.of(context).primaryTextTheme.headline4,
              ),
              isMandatory == true
                  ? Text(
                      '*',
                      style: labelStyle ??
                          Theme.of(context)
                              .primaryTextTheme
                              .headline4
                              ?.copyWith(color: Palette.RED),
                    )
                  : Container(),
            ],
          )),
    );
  }

  Widget _field(BuildContext context, ThemeStore ts) {
    return InkWell(
      onTap: () => _onTapTimeField(context),
      child: Container(
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
              border: Border.all(
                  color: validationMessage != null && validationMessage != ''
                      ? Palette.SALMON_PEARL
                      : Palette.CHINESE_WHITE),
              borderRadius: const BorderRadius.all(Radius.circular(4))),
          child: Row(children: [
            Expanded(
                child: Text(
              timeText ?? 'hh:mm AM',
              style: Theme.of(context).primaryTextTheme.bodyText1,
            )),
            const Icon(
              Icons.watch,
              color: Palette.TROLLEY_GRAY,
              size: 20.0,
            )
          ])),
    );
  }

  Widget _errorLabel(BuildContext context, ThemeStore ts) {
    return validationMessage != null && validationMessage != ''
        ? Container(
            margin: EdgeInsets.only(
              top: 4,
            ),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  validationMessage ?? '',
                  style: Theme.of(context)
                      .primaryTextTheme
                      .headline4
                      ?.copyWith(color: Palette.SALMON_PEARL),
                )),
          )
        : Container();
  }

  void _onTapTimeField(BuildContext context) async {
    var newTime = await showRoundedTimePicker(
      context: context,
      initialTime: time ?? (initialTime ?? TimeOfDay.now()),
      borderRadius: 16,
    );

    if (onTimeSelection != null) {
      onTimeSelection!(newTime);
    }

    timeText = newTime != null ? formatTimeOfDay(newTime) : null;
    time = newTime;
  }

  String formatTimeOfDay(TimeOfDay tod) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat.jm(); //"6:00 AM"
    return format.format(dt);
  }
}
