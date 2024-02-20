part of 'pokemon_cubit.dart';

sealed class PokemonState {}

final class PokemonInitial extends PokemonState {}
final class PokemonLoadingState extends PokemonState {}
final class PokemonSucessState extends PokemonState {}
final class PokemonFaluireState extends PokemonState {}
