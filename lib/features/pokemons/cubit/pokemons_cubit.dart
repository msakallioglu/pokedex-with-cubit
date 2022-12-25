import 'package:bloc/bloc.dart';
import 'package:pokedex_with_cubit/features/pokemons/cubit/pokemons_state.dart';

import '../../../models/pokemon_data_model.dart';
import '../../../services/pokemons_service_imp.dart';

class PokemonsCubit extends Cubit<PokemonState> {
  PokemonsCubit() : super(PokemonsInitial());

  Future<void> getPokemons(int limit) async {
    emit(PokemonsLoading());
    final getResult = await (PokemonServiceImp().getPokemons(limit));
    getResult.fold((l) => emit(PokemonsError()), (PokemonData r) {
      emit(
        PokemonsSucces(pokemonData: r),
      );
    });
  }
}
