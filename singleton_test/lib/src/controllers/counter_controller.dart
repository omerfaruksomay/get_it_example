import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@singleton
class CounterController {
  // static final CounterController _singleton = CounterController._internal();

  // factory CounterController() {
  //   return _singleton;
  // }

  // CounterController._internal();

  ValueNotifier<int> counter = ValueNotifier(0);

  increaseCount() {
    counter.value += 1;
  }
}
