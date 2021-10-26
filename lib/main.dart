import 'package:flambu_test/features/dogs/presentation/logic_holders/breed_list_bloc/bloc.dart';
import 'package:flambu_test/features/dogs/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flambu_test/injection_container.dart' as injector;
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/dogs/presentation/logic_holders/dog_image_bloc/bloc.dart';

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
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => injector.serviceLocator<BreedListBloc>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<DogImageBloc>(),
          ),
        ],
        child: HomePage(),
      ),
    );
  }
}
