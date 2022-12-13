import 'package:finap_base_theme/palette.dart';
import 'package:pasindu_sample_app/theme/theme_values/base_images.dart';
import 'package:flutter/material.dart';

class DefaultLoader extends StatelessWidget {
  final String? loadingTitle;
  const DefaultLoader({Key? key, this.loadingTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(BaseImages.loader),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
              child: Text(
                loadingTitle ?? 'Loading',
                style: Theme.of(context)
                    .primaryTextTheme
                    .headline3
                    ?.copyWith(color: Palette.BLACK),
                textAlign: TextAlign.center,
              ))
        ],
      ),
    );
  }
}
