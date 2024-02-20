import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/view_model/cubits/cubit/pokemon_cubit.dart';
import 'package:pokemon_app/view_model/utils/themes/light_theme.dart';

import 'view/screens/home_page.dart';
import 'view_model/cubits/bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PokemonCubit>(
          create: (context) => PokemonCubit()..tryCatch(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pokemon App',
        theme: lightTheme,
        home: const MyHomePage(),
      ),
    );
  }
}
