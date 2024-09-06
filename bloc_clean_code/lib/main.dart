import 'package:bloc_clean_code/bloc/counter_bloc.dart';
import 'package:bloc_clean_code/bloc/switch_bloc.dart';
import 'package:bloc_clean_code/ui/counter_screen.dart';
import 'package:bloc_clean_code/ui/switch_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CounterBloc(),
        child: BlocProvider(
          create: (context) => SwitchBloc(),
          child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            debugShowCheckedModeBanner: false,
            home: SwitchScreen(),
          ),
        ));
  }
}
