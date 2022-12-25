import '../../../models/pokemon_data_model.dart';

abstract class PokemonState {

}
class PokemonsInitial extends PokemonState {
  int limit=10;
}

class PokemonsLoading extends PokemonState {}

class PokemonsSucces extends PokemonState {
  final PokemonData pokemonData;
  PokemonsSucces({
    required this.pokemonData,
  }) : super();
}

class PokemonsError extends PokemonState {

}