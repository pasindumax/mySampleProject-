import 'package:pasindu_sample_app/core/components/chip_item/chip_item_status_colors.dart';
import 'package:pasindu_sample_app/theme/theme_values/pasindu_sample_theme/color_palatte.dart';

enum PackageStatus {
  newOrder,
  cancelled,
  holdByOutlet,
  grouped,
  scheduled,
  riderPickedUp,
  riderRejected,
  riderOnTheWay,
  delivered,
  deliveryConfirmed,
  holdByRider,
  returned,
}

extension PackageStatusExtension on PackageStatus {
  String get packageStatusName {
    switch (this) {
      case PackageStatus.newOrder:
        return 'New';
      case PackageStatus.cancelled:
        return 'Cancelled';
      case PackageStatus.holdByOutlet:
        return 'Hold by Outlet';
      case PackageStatus.grouped:
        return 'Grouped';
      case PackageStatus.scheduled:
        return 'Scheduled';
      case PackageStatus.riderPickedUp:
        return 'Rider Picked Up';
      case PackageStatus.riderRejected:
        return 'Rider Rejected';
      case PackageStatus.riderOnTheWay:
        return 'Rider On the way';
      case PackageStatus.delivered:
        return 'Delivered';
      case PackageStatus.deliveryConfirmed:
        return 'Delivery Confirmed';
      case PackageStatus.holdByRider:
        return 'Hold by Rider';
      case PackageStatus.returned:
        return 'Returned';
    }
  }

  int get sortingIndex {
    switch (this) {
      case PackageStatus.newOrder:
        return 1;
      case PackageStatus.cancelled:
        return 2;
      case PackageStatus.holdByOutlet:
        return 3;
      case PackageStatus.grouped:
        return 4;
      case PackageStatus.scheduled:
        return 5;
      case PackageStatus.riderPickedUp:
        return 6;
      case PackageStatus.riderRejected:
        return 7;
      case PackageStatus.riderOnTheWay:
        return 8;
      case PackageStatus.delivered:
        return 9;
      case PackageStatus.deliveryConfirmed:
        return 10;
      case PackageStatus.holdByRider:
        return 11;
      case PackageStatus.returned:
        return 12;
    }
  }

  ChipItemStatusColors get color {
    switch (this) {
      case PackageStatus.newOrder:
        return ChipItemStatusColors(
            chipTextColor: ColorPalette.white,
            chipBackgroundColor: ColorPalette.blue);
      case PackageStatus.cancelled:
        return ChipItemStatusColors(
            chipTextColor: ColorPalette.white,
            chipBackgroundColor: ColorPalette.red);
      case PackageStatus.holdByOutlet:
        return ChipItemStatusColors(
            chipTextColor: ColorPalette.white,
            chipBackgroundColor: ColorPalette.orange);
      case PackageStatus.grouped:
        return ChipItemStatusColors(
            chipTextColor: ColorPalette.white,
            chipBackgroundColor: ColorPalette.orange);
      case PackageStatus.scheduled:
        return ChipItemStatusColors(
            chipTextColor: ColorPalette.white,
            chipBackgroundColor: ColorPalette.orange);
      case PackageStatus.riderPickedUp:
        return ChipItemStatusColors(
            chipTextColor: ColorPalette.white,
            chipBackgroundColor: ColorPalette.orange);
      case PackageStatus.riderRejected:
        return ChipItemStatusColors(
            chipTextColor: ColorPalette.white,
            chipBackgroundColor: ColorPalette.red);
      case PackageStatus.riderOnTheWay:
        return ChipItemStatusColors(
            chipTextColor: ColorPalette.white,
            chipBackgroundColor: ColorPalette.orange);
      case PackageStatus.delivered:
        return ChipItemStatusColors(
            chipTextColor: ColorPalette.white,
            chipBackgroundColor: ColorPalette.brand);
      case PackageStatus.deliveryConfirmed:
        return ChipItemStatusColors(
            chipTextColor: ColorPalette.white,
            chipBackgroundColor: ColorPalette.brand);
      case PackageStatus.holdByRider:
        return ChipItemStatusColors(
            chipTextColor: ColorPalette.white,
            chipBackgroundColor: ColorPalette.orange);
      case PackageStatus.returned:
        return ChipItemStatusColors(
            chipTextColor: ColorPalette.white,
            chipBackgroundColor: ColorPalette.red);
    }
  }
}
