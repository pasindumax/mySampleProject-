import 'dart:async';
import 'dart:convert';

import 'package:interpolator/interpolator.dart';
import 'package:pasindu_sample_app/flavour_config.dart';
import 'package:pasindu_sample_app/store/environment_store/environmental.store.dart';
import 'package:uuid/uuid.dart';
import 'package:web_socket_channel/io.dart';

class SocketManager {
  late final String classIdentifier = 'SocketManager';

  //final Logger? logger;
  final Uuid? uuid;
  //IO.Socket? socket;
  IOWebSocketChannel? channel;
  Timer? reconnectTimer;
  EnvironmentalStore environmentalStore;
  String _projectAppID = '';
  SocketManager({required this.environmentalStore, required this.uuid}) {
    initPlatformState();
    init();
  }
  initPlatformState() async {
    String projectAppID;
    try {
      //   projectAppID = await GetVersion.appID;
    } catch (e) {
      projectAppID = 'Failed to get app ID.';
    }

    //  _projectAppID = projectAppID;
  }

  Future<bool> init() async {
    try {
      final url = Uri.parse((environmentalStore.environmentConfig
                  ?.serverEndPoints?[ServerEndPoints.baseUrlWS] ??
              '') +
          (Interpolator(
              environmentalStore.environmentConfig?.endPoints?.ws ?? '')(
            {
              'app_id': '1089',
            },
          )));
      channel = IOWebSocketChannel?.connect(url,
          headers: environmentalStore.environmentConfig?.publicRequestHeader);
      channel?.stream.listen(onData,
          onError: onError, onDone: onDone, cancelOnError: true);
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  void onDone() async {
    try {
      await reconnect();
    } on Exception catch (_) {}
  }

  void onError(err) async {
    try {
      await reconnect();
    } on Exception catch (_) {}
  }

  void onData(event) async {
    try {
      final receivedData = jsonDecode(event) as Map<String, dynamic>;
      print(receivedData);
    } on Exception catch (_) {}
  }

  Future<bool> sendData(Map<String, dynamic> data) async {
    try {
      channel?.sink.add(jsonEncode(data));
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  Future<bool> closeSocket() async {
    try {
      await channel?.sink.close();
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  Future<dynamic> reconnect() async {
    try {
      if (channel != null) {
        await Future.delayed(Duration(seconds: 4));
      }
      await init();
    } on Exception catch (_) {}
  }
}
