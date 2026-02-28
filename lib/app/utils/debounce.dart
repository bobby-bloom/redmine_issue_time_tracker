import 'dart:async';

Map _timeouts = {};

void debounce(int timeoutMS, Function target, List arguments) {
  if (_timeouts.containsKey(target)) {
    _timeouts[target].cancel();
  }

  Timer timer = Timer(Duration(milliseconds: timeoutMS), () {
    Function.apply(target, arguments);
  });

  _timeouts[target] = timer;
}
