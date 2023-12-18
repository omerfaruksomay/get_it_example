import 'package:flutter/material.dart';
import 'package:singleton_test/src/di/injection.dart';
import 'package:singleton_test/src/modules/local_storage/key_value_storage_abstract.dart';

class PageEnvControl extends StatefulWidget {
  const PageEnvControl({super.key});

  @override
  State<PageEnvControl> createState() => _PageEnvControlState();
}

class _PageEnvControlState extends State<PageEnvControl> {
  var newValue = '', readedValue = '';

  @override
  void initState() {
    super.initState();
    getIt<IKeyValueStorage>().init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(getIt<IKeyValueStorage>().type.name),
          TextField(
            onChanged: (e) {
              newValue = e;
            },
          ),
          TextButton(
              onPressed: () async {
                await getIt<IKeyValueStorage>().write('key', newValue);
              },
              child: const Text('add')),
          TextButton(
              onPressed: () async {
                readedValue = await getIt<IKeyValueStorage>().read('key');
                setState(() {});
              },
              child: const Text('read')),
          Text('Current Value : $readedValue')
        ],
      ),
    );
  }
}
