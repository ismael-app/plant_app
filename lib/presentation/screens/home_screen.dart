import 'package:flutter/material.dart';
import 'package:plant_app/domain/entities/plant.dart';
import 'package:plant_app/domain/repositories/plant_repository.dart';
import 'package:plant_app/infrastructure/repositories/plant_respository_impl.dart';
import 'package:plant_app/presentation/screens/plant_detail_screen.dart';
import 'package:plant_app/presentation/widgets/header.dart';
import 'package:plant_app/presentation/widgets/plant_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PlantRepository _plantRepository = PlantRespositoryImpl();

  late final Future<List<Plant>> _categoriesFuture;
  late final Future<List<Plant>> _popularFuture;

  final double heightCategory = 350.0;

  @override
  void initState() {
    super.initState();

    _categoriesFuture = _plantRepository.getCategories();
    _popularFuture = _plantRepository.getPopular();
  }

  void _openDetails(Plant plant) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => PlantDetailScreen(plant: plant)),
    );
  }

  @override
  Widget build(BuildContext context) {
    const String avatar = 'assets/images/isma.jpeg';

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10.0),

              const Header(userName: 'Ismael', avatar: avatar),

              const SizedBox(height: 24.0),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Categories',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 20),

                      FutureBuilder<List<Plant>>(
                        future: _categoriesFuture,

                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return SizedBox(
                                  height: heightCategory,
                                  child: const CircularProgressIndicator(),
                                );
                              }

                              if (snapshot.hasError ||
                                  !snapshot.hasData ||
                                  snapshot.data!.isEmpty) {
                                return SizedBox(
                                  height: heightCategory,
                                  child: const Center(
                                    child: Text(
                                      'No se pudieron cargar las categorias',
                                    ),
                                  ),
                                );
                              }

                              final categories = snapshot.data!;

                              return SizedBox(
                                height: heightCategory,
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Expanded(
                                      child: PlantCard(
                                        plant: categories[0],
                                        onTap: () =>
                                            _openDetails(categories[0]),
                                      ),
                                    ),

                                    const SizedBox(width: 14.0),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Expanded(
                                            child: PlantCard(
                                              plant: categories[1],
                                              onTap: () =>
                                                  _openDetails(categories[1]),
                                            ),
                                          ),

                                          const SizedBox(height: 14),

                                          Expanded(
                                            child: PlantCard(
                                              plant: categories[2],
                                              onTap: () =>
                                                  _openDetails(categories[2]),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        'Popular',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 20.0),

                      SizedBox(
                        height: 180,
                        child: FutureBuilder<List<Plant>>(
                          future: _popularFuture,
                          builder:
                              (
                                BuildContext context,
                                AsyncSnapshot<List<Plant>> snapshot,
                              ) {
                                if (!snapshot.hasData) {
                                  return const Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 20.0,
                                    ),
                                  );
                                }

                                final popular = snapshot.data!;

                                return ListView.builder(
                                  itemCount: popular.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                        final plant = popular[index];
                                        return Container(
                                          width: 200,
                                          margin: const EdgeInsets.only(
                                            right: 14.0,
                                          ),
                                          child: PlantCard(
                                            plant: plant,
                                            showName: false,
                                            onTap: () => _openDetails(plant),
                                          ),
                                        );
                                      },
                                );
                              },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
