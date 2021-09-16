import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'info_model.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  static Widget create(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => InfoModel(),
      child: const InfoPage(),
    );
  }

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    final model = context.read<InfoModel>();
    model.init().then((_) {
      _controller.value = TextEditingValue(
        text: model.hostname,
        selection: TextSelection.collapsed(offset: model.hostname.length),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<InfoModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text('${model.hostname} (${model.staticHostname})'),
      ),
      body: Center(
        child: TextField(controller: _controller),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => model.setHostname(_controller.value.text),
        child: const Icon(Icons.check),
      ),
    );
  }
}
