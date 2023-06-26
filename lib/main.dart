import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:todoapp/Screens/SplashScreen.dart';
import 'package:todoapp/data/Cubit/cubit.dart';
import 'package:todoapp/data/localDataSource/Sqflight.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalDataSource().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppCubit>(
      create: (context) => AppCubit()..getData(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}