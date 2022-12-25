import 'package:dartz/dartz.dart';
import '../core/failures/failures.dart';
import '../models/pokemon_data_model.dart';
import '../models/pokemon_model.dart';

abstract class PokemonsServices {
  Future<Either<FetchFailure,PokemonData>> getPokemons(int limit);
  Future<Either<Pokemon, FetchFailure>> getPokemonsDetails(String pokemonId);
}
