import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_bloc/general_observer.dart';

import 'app.dart';

void main() {
  Bloc.observer = MyObserver();
  runApp(const App());
}
