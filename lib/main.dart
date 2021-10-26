import 'package:flambu_test/features/dogs/presentation/bloc/bloc.dart';
import 'package:flambu_test/features/dogs/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flambu_test/injection_container.dart' as injector;
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  injector.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (_) => injector.serviceLocator<BreedListBloc>(),
        child: const HomePage(),
      ),
    );
  }
}
