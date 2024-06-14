import 'dart:io';

import 'package:fur/shared/exceptions/failure.dart';

abstract class NetworkInfo {
  Future<bool> hasInternet();
}

class NetworkInfoImpl implements NetworkInfo {
  @override
  Future<bool> hasInternet() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) return true;
      throw Failure('device:no-internet');
    } on SocketException catch (_) {
      throw Failure('device:no-internet');
    }
  }
}
