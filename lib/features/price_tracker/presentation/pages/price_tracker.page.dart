import 'package:pasindu_sample_app/core/components/base_app_bar/base_app_bar.component.dart';
import 'package:pasindu_sample_app/features/price_tracker/presentation/mobx/landing/price_tracker.store.dart';
import 'package:pasindu_sample_app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class PriceTrackerPage extends StatefulWidget {
  const PriceTrackerPage({Key? key}) : super(key: key);

  @override
  State<PriceTrackerPage> createState() => _PriceTrackerPageState();
}

class _PriceTrackerPageState extends State<PriceTrackerPage> {
  final PriceTrackerStore _store = di();

  final List<ReactionDisposer> _disposers = [];

  @override
  void initState() {
    super.initState();

    _store.init(context);
  }

  @override
  void dispose() {
    super.dispose();
    _store.dispose(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: 'Price Tracker',
      ),
      body: Container(),
    );
  }
}
