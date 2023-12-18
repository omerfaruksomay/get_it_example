import 'package:flutter/material.dart';
import 'package:singleton_test/src/constants/build_env.dart';
import 'package:singleton_test/src/di/injection.dart';
import 'package:singleton_test/src/ui/pages/env_control_page.dart';

import '../../controllers/counter_controller.dart';

class PageCounter extends StatefulWidget {
  const PageCounter({super.key});

  @override
  State<PageCounter> createState() => _PageCounterState();
}

class _PageCounterState extends State<PageCounter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            ValueListenableBuilder(
                valueListenable:
                    getIt<CounterController>().counter, //controller.counter,
                builder: (context, value, child) {
                  return Text('$value');
                }),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (c) => const PageCounter()));
                },
                child: const Text('push new Counter page ')),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (c) => const PageEnvControl()));
                },
                child: const Text('push Env Control Page ')),
            TextButton(
                onPressed: () async {
                  if (BuildEnv.currentEnv == BuildEnv.hiveEnv) {
                    BuildEnv.currentEnv = BuildEnv.sharedPrefsEnv;
                  } else {
                    BuildEnv.currentEnv = BuildEnv.hiveEnv;
                  }
                  await getIt.reset();
                  configureDependencies();
                },
                child: const Text('swtich')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getIt<CounterController>()
            .increaseCount, //controller.increaseCount,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
