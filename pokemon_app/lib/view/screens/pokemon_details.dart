// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../model/pokemon.dart';
import '../../view_model/utils/colors/colors.dart';

class PokemonDetails extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonDetails({super.key, required this.pokemon});

//* for the body

  BodyWidget(BuildContext context) => Stack(
        children: [
          Positioned(
            height: MediaQuery.of(context).size.height / 1.4,
            width: MediaQuery.of(context).size.width - 30,
            left: 15,
            top: MediaQuery.of(context).size.height * .1,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  15,
                ),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                   const SizedBox(height: 70,),
                    Text(
                      pokemon.name,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      "Height  :${pokemon.height}",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      "Weight  :${pokemon.weight}",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                     Text(
                      "Types",
                  style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: pokemon.type!
                          .map(
                            (e) => FilterChip(
                              backgroundColor: AppColors.amber,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              selectedColor: AppColors.red,
                              selected: false,
                              label: Text(
                                e,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              onSelected: (b) {},
                            ),
                          )
                          .toList(),
                    ),
                    Text(
                      "Weakness",
                          style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: pokemon.weaknesses!
                          .map(
                            (e) => FilterChip(
                              backgroundColor: AppColors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              selectedColor: AppColors.red,
                              selected: false,
                              label: Text(
                                e,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: AppColors.white,
                                    ),
                              ),
                              onSelected: (b) {},
                            ),
                          )
                          .toList(),
                    ),
                     Text(
                      "Next Evolution",
                         style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: pokemon.nextEvolution!
                          .map(
                            (n) => FilterChip(
                              backgroundColor: AppColors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              selectedColor: AppColors.red,
                              selected: false,
                              label: Text(
                                n.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      color: AppColors.white,
                                    ),
                              ),
                              onSelected: (b) {},
                            ),
                          )
                          .toList(),
                    ),
                  ]),
            ),
          ),
          Align(
              alignment: Alignment.topCenter,
              child: Hero(

                transitionOnUserGestures: true,
                tag: pokemon.img,
                child: Container(
                  height: 200.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                        image: Image.network(pokemon.img).image),
                  ),
                ),
              ))
        ],
      );



//* build method
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 20,
          ),
        ),
      ),
      backgroundColor: AppColors.primaryColor,
      body: BodyWidget(context),
    );
  }
}
