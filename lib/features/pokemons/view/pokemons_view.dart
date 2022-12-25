import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_with_cubit/core/extension/context_extension.dart';

import '../../../core/theme/text_style_theme.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_auto_size_text.dart';
import '../cubit/pokemons_cubit.dart';
import '../cubit/pokemons_state.dart';
import '../widgets/custom_card.dart';

class PokemonsView extends StatelessWidget {
  const PokemonsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>PokemonsCubit( 
      )..getPokemons(30),
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(context.screenHeight(0.07)),
            child: const CustomAppBar(),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomAutoSizeText(
                    text: "Pokemons",
                    maxFontSize: 30,
                    minFontSize: 28,
                    maxLines: 1,
                    textStyle: getTextStyle(Colors.orange, FontWeight.w400),
                    textScaleFactor: 1.0,
                    textAlign: TextAlign.left),
                BlocBuilder<PokemonsCubit, PokemonState>(
                  builder: (context, state) {
                  if (state is PokemonsLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is PokemonsSucces) {
                    return Expanded(
                      child: GridView.builder(
                          shrinkWrap: true,
                          itemCount: state.pokemonData.results.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisExtent: context.screenHeight(0.20),
                              childAspectRatio: 1,
                              crossAxisSpacing: 0.5,
                              mainAxisSpacing: 5,
                              crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            return CustomCard(
                                pakemoName: state.pokemonData.results[index].name,
                                pokemonId: (index + 1).toString(),
                                onPressed: () => null);
                          }),
                    );
                  } else if (state is PokemonsError) {
                    return Container();
                  } else {
                    return Container();
                  }
                }),
              ],
            ),
          )),
    );
  }
}
