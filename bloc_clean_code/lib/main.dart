import 'package:bloc_clean_code/bloc/ImagePicker/bloc/image_picker_bloc.dart';
import 'package:bloc_clean_code/bloc/counter/counter_bloc.dart';
import 'package:bloc_clean_code/bloc/switch/switch_bloc.dart';
import 'package:bloc_clean_code/todo/bloc/todo_bloc.dart';

import 'package:bloc_clean_code/ui/image_picker/image_picker_screen.dart';
import 'package:bloc_clean_code/ui/todo_ui/todo_screen.dart';
import 'package:bloc_clean_code/utils/image_picker_utils.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterBloc()),
        BlocProvider(create: (_) => SwitchBloc()),
        BlocProvider(
          create: (context) => ImagePickerBloc(ImagePickerUtils()),
        ),
        BlocProvider(
          create: (context) => TodoBloc(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: TodoScreen(),
      ),
    );
  }
}
