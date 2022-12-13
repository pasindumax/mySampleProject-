import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
part 'price_tracker.store.g.dart';

class PriceTrackerStore = _PriceTrackerStore with _$PriceTrackerStore;

abstract class _PriceTrackerStore with Store {
  //final List<PriceTrackerStore> _disposers = [];

  _PriceTrackerStore() {}

  /// *************************************************************************
  /// INIT - START
  ///**************************************************************************/
  @observable
  @action
  void init(BuildContext context) {}

  @action
  void dispose(BuildContext context) {}

  /// *************************************************************************
  /// INIT - END
  ///**************************************************************************/

}
