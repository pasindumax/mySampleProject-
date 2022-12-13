import 'dart:ui';
import 'package:pasindu_sample_app/theme/theme_values/base_svgs.dart';
import 'package:pasindu_sample_app/theme/theme_values/pasindu_sample_theme/color_palatte.dart';

enum PackageTag {
  cashOnDelivery,
  chillBox,
  refund,
}

extension PackageTagExtension on PackageTag {
  String get packageStatusName {
    switch (this) {
      case PackageTag.cashOnDelivery:
        return 'Cash On Delivery';
      case PackageTag.chillBox:
        return 'Chill Box';
      case PackageTag.refund:
        return 'refund';
    }
  }

  int get sortingIndex {
    switch (this) {
      case PackageTag.cashOnDelivery:
        return 1;
      case PackageTag.chillBox:
        return 2;
      case PackageTag.refund:
        return 3;
    }
  }

  Color get color {
    switch (this) {
      case PackageTag.cashOnDelivery:
        return ColorPalette.brand;
      case PackageTag.chillBox:
        return ColorPalette.blue;
      case PackageTag.refund:
        return ColorPalette.orange;
    }
  }

  String get image {
    switch (this) {
      case PackageTag.cashOnDelivery:
        return BaseSvgs.cashOnDeliveryIcon;
      case PackageTag.chillBox:
        return BaseSvgs.coolBoxIcon;
      case PackageTag.refund:
        return BaseSvgs.refundIcon;
    }
  }

  PackageTag statusEnum(int value) {
    switch (value) {
      case 1:
        return PackageTag.cashOnDelivery;
      case 2:
        return PackageTag.chillBox;
      case 3:
        return PackageTag.refund;

      default:
        return PackageTag.cashOnDelivery;
    }
  }
}
