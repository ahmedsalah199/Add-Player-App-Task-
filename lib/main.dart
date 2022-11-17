import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:players/app/injection.dart' as di;

import 'app/app.dart';
import 'cubit/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  await di.init();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}
