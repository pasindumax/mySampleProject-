import 'package:pasindu_sample_app/store/theme_store/theme.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:provider/provider.dart';
import 'package:finap_datetime_helper/finap_datetime_helper.dart';
import 'package:finap_base_theme/palette.dart';

class DefaultDatePicker extends StatelessWidget {
  final double? topMargin;
  final String? labelText;
  final TextStyle? labelStyle;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final bool? isMandatory;
  final Function(DateTime?)? onDateSelection;
  final String? validationMessage;
  DefaultDatePicker(
      {Key? key,
      this.topMargin,
      this.labelText,
      this.labelStyle,
      this.initialDate,
      this.firstDate,
      this.lastDate,
      this.onDateSelection,
      this.isMandatory,
      this.validationMessage})
      : super(key: key);

  String? dateText;
  DateTime? date;
  @override
  Widget build(BuildContext context) {
    final ts = Provider.of<ThemeStore>(context);
    dateText = DateTimeHelper.getOnlyDateString(
        initialDate?.toUtc().millisecondsSinceEpoch);
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
      onTap: () => _onTapDateField(context),
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
              dateText ?? 'dd/mm/yyyy',
              style: Theme.of(context).primaryTextTheme.bodyText1!.copyWith(
                    fontSize: 16,
                  ),
            )),
            const Icon(
              Icons.calendar_today,
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

  void _onTapDateField(BuildContext context) async {
    var newDateTime = await showRoundedDatePicker(
      context: context,
      initialDate: date ?? (initialDate ?? DateTime.now()),
      firstDate: firstDate,
      lastDate: lastDate,
      borderRadius: 16,
    );

    if (onDateSelection != null) {
      onDateSelection!(newDateTime);
    }

    dateText = newDateTime != null
        ? DateTimeHelper.getOnlyDateString(
            newDateTime.toUtc().millisecondsSinceEpoch)
        : null;
    date = newDateTime;
  }
}
