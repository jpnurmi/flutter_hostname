import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart' as yaru;

import 'info_page.dart';

void main() => runApp(const HostnameApp());

class HostnameApp extends StatelessWidget {
  const HostnameApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: yaru.lightTheme,
      darkTheme: yaru.darkTheme,
      home: InfoPage.create(context),
    );
  }
}
