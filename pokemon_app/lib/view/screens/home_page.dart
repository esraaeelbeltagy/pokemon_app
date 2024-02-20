import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pokemon_app/view_model/cubits/cubit/pokemon_cubit.dart';
import 'package:pokemon_app/view_model/utils/colors/colors.dart';

import 'pokemon_details.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pokemon App"),
      ),
      body: BlocBuilder<PokemonCubit, PokemonState>(
        builder: (context, state) {
          PokemonCubit cubit = PokemonCubit.get(context);
          return state is PokemonLoadingState
              ? Center(
                  child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ))
              : GridView.count(
                  crossAxisCount: 2,
                  children: cubit.pokemons
                      .map((poke) => Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        PokemonDetails(pokemon: poke),
                                  ),
                                );
                              },
                              child: Hero(
                                
                                transitionOnUserGestures: true,
                                tag: poke.img,
                                child: Card(
                                  elevation: 5.0,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image:
                                                  Image.network(poke.img).image),
                                        ),
                                      ),
                                      Text(
                                        poke.name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                );
        },
      ),
      drawer: const Drawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        backgroundColor: AppColors.primaryColor,
        child: Icon(
          Icons.refresh,
          color: AppColors.white,
        ),
      ),
    );
  }
}
