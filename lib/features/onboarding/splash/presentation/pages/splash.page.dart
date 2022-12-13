import 'package:flutter/material.dart';
import 'package:pasindu_sample_app/features/onboarding/splash/presentation/mobx/splash.store.dart';
import 'package:pasindu_sample_app/injection_container.dart';
import 'package:mobx/mobx.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SplashStore _store = di();
  final List<ReactionDisposer> _disposers = [];

  @override
  void initState() {
    // TODO: implement initState
    _store.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(),
          ],
        ),
      ),
    );
  }
}
