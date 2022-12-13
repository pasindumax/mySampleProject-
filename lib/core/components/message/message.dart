import 'package:finap_base_theme/palette.dart';
import 'package:finap_base_theme/theme_variation_type.dart';
import 'package:pasindu_sample_app/core/components/bar_button/bar_button.component.dart';
import 'package:pasindu_sample_app/store/theme_store/theme.store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:finap_extensions/string_extension.dart';

class Message extends StatelessWidget {
  final String? title;
  final String message;
  final String? submitButtonTitle;
  final Function? onTapSubmitCallback;
  final bool? isDismissible;
  final ThemeVariationType themeVariationType;
  final ThemeStore? ts;

  const Message(
      {Key? key,
      this.title,
      required this.message,
      this.submitButtonTitle,
      this.onTapSubmitCallback,
      this.isDismissible,
      this.themeVariationType = ThemeVariationType.success,
      required this.ts})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ts = Provider.of<ThemeStore>(context);
    return WillPopScope(
      onWillPop: () {
        return Future.value(isDismissible ?? true);
      },
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24), topRight: Radius.circular(24)),
        child: Container(
          color: Colors.white,
          child: Wrap(
            children: <Widget>[
              _closeIcon(context),
              _title(context, ts),
              _message(context),
              _submitButton(context, ts)
            ],
          ),
        ),
      ),
    );
  }

  Widget _closeIcon(BuildContext context) {
    return isDismissible == true
        ? Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.close),
            ),
          )
        : Container();
  }

  Widget _title(BuildContext context, ThemeStore ts) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(
            top: ts.tc.dimensions.lgsp,
            right: ts.tc.dimensions.xlsp,
            left: ts.tc.dimensions.xlsp),
        child: Center(
            child: Text(
          title ?? _titleText(context, themeVariationType),
          style: Theme.of(context)
              .primaryTextTheme
              .headline2
              ?.copyWith(color: Palette.BLACK),
          textAlign: TextAlign.center,
        )),
      ),
    );
  }

  Widget _message(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .primaryTextTheme
              .bodyText1
              ?.copyWith(color: Palette.BLACK),
        ),
      ),
    );
  }

  Widget _submitButton(BuildContext context, ThemeStore ts) {
    return Padding(
      padding: EdgeInsets.only(
          right: ts.tc.dimensions.xlsp,
          bottom: ts.tc.dimensions.xlsp,
          left: ts.tc.dimensions.xlsp),
      child: FractionallySizedBox(
        widthFactor: 1,
        child: BarButton(
          title:
              submitButtonTitle ?? 'defaultMessageSubmitBtnTitle'.i18n(context),
          themeVariationType: themeVariationType,
          onTap: onTapSubmitCallback != null
              ? () {
                  (onTapSubmitCallback)!();
                  closeMessage(context);
                }
              : () => closeMessage(context),
          width: 90.w,
        ),
      ),
    );
  }

  String _titleText(BuildContext context, ThemeVariationType variationType) {
    switch (variationType) {
      case ThemeVariationType.info:
        return 'infoMessageTitle'.i18n(context);
      case ThemeVariationType.success:
        return 'successMessageTitle'.i18n(context);
      case ThemeVariationType.error:
        return 'errorMessageTitle'.i18n(context);
      case ThemeVariationType.warning:
        return 'warningMessageTitle'.i18n(context);
      case ThemeVariationType.primary:
        return 'primaryMessageTitle'.i18n(context);
    }
  }

  void closeMessage(BuildContext context) {
    Navigator.pop(context);
  }
}
