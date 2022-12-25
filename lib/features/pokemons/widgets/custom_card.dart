import 'package:flutter/material.dart';
import 'package:pokedex_with_cubit/core/extension/context_extension.dart';
import '../../../core/theme/text_style_theme.dart';
import '../../../widgets/custom_auto_size_text.dart';

class CustomCard extends StatelessWidget {
  final String pakemoName;
  final String pokemonId;
  final Function() onPressed;
  const CustomCard(
      {super.key, required this.pakemoName, required this.pokemonId, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15), side: const BorderSide(color: Colors.orange)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 2,
                child: Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: onPressed,
                      child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: Icon(
                            Icons.favorite,
                            color:  Colors.grey.shade300,    
                            size: context.screenWidth(0.1),
                          )),
                    )),
              ),
              Expanded(
                flex: 4,
                child: Center(
                  child: CustomAutoSizeText(
                      text: pakemoName,
                      maxFontSize: 20,
                      minFontSize: 18,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      textScaleFactor: 1.0,
                      textStyle: getTextStyle(Colors.black, FontWeight.w400)),
                ),
              ),
            ],
          ),
        ));
  }
}
