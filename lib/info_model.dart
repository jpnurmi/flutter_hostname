import 'package:flutter/foundation.dart';

import 'hostname_service.dart';

class InfoModel extends ChangeNotifier {
  InfoModel([HostnameService? service])
      : _service = service ?? HostnameService();

  final HostnameService _service;

  Future<void> init() => _service.init().then((_) => notifyListeners());

  String get hostname => _service.hostname;
  String get staticHostname => _service.staticHostname;

  void setHostname(String hostname) {
    _service.setHostname(hostname).then((_) => notifyListeners());
  }

  @override
  void dispose() {
    _service.dispose();
    super.dispose();
  }
}
