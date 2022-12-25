import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:pokedex_with_cubit/services/pokemon_service.dart';
import '../core/failures/failures.dart';
import '../core/helpers/api_config.dart';
import '../models/pokemon_data_model.dart';
import '../models/pokemon_model.dart';

class PokemonServiceImp implements PokemonsServices {
  Dio? dio;

  PokemonServiceImp() {
    dio = Dio(BaseOptions());
  }

  @override
  Future<Either<FetchFailure, PokemonData>> getPokemons(int limit) async {
    try {
      Response response = await dio!.get("${ApiConfig.baseURL}?offset=0&limit=$limit");
      if (response.statusCode == HttpStatus.ok) {
        return Right(PokemonData.fromJson(response.data));
      } else {
        return const Left(FetchFailure(message: "oh no !"));
      }
    } catch (e) {
      return const Left(FetchFailure(message: "oh no !"));
    }
  }

  @override
  Future<Either<Pokemon, FetchFailure>> getPokemonsDetails(String pokemonId) {
    // TODO: implement getPokemonsDetails
    throw UnimplementedError();
  }
}
