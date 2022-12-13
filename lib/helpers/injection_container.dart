import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:finap_connectivity_helper/finap_connectivity_helper.dart';
import 'package:finap_currency_helper/finap_currency_helper.dart';
import 'package:finap_secure_shared_preferences/finap_secure_shared_preferences.dart';
import 'package:finap_validator/finap_validator.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

Future<void>? setup(GetIt di) async {
  //http client
  di.registerLazySingleton(() => http.Client());

  //uuid
  di.registerLazySingleton(() => const Uuid());

  //connectivity
  di.registerLazySingleton(
      () => ConnectivityHelper(connectivity: Connectivity()));

  //flutter secure storage
  di.registerLazySingleton(
      () => SecureSharedPref(storage: const FlutterSecureStorage()));

  //currency helper
  di.registerLazySingleton(() => CurrencyHelper());

  //validator
  di.registerLazySingleton(() => Validator(currencyHelper: di()));
}
