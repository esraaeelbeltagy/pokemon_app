import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pokemon_app/model/pokemon.dart';

part 'pokemon_state.dart';

class PokemonCubit extends Cubit<PokemonState> {
  PokemonCubit() : super(PokemonInitial());

  static PokemonCubit get(context) => BlocProvider.of(context);

  final dio = Dio();
  List<Pokemon> pokemons = [];

  final url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  //!fecth data from api
  void fetchData() async {
    Response response = await dio.get(url);
    var decodedResponse = jsonDecode(response.data);
    PokemonModel pokemonModel = PokemonModel.fromJson(decodedResponse);
    pokemons = pokemonModel.pokemon!.toList();

    print(response.data);
    print("Done !!!!!!!!!!!!!!");
         emit(PokemonSucessState());
 
  }

//! try catch and emit the state
  tryCatch() {
    try {
      emit(PokemonLoadingState());
      fetchData();
 
    } catch (e) {
      emit(PokemonFaluireState());
      print(e.toString());
    }
  }
}
