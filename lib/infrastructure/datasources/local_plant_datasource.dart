import 'package:plant_app/domain/entities/plant.dart';

class LocalPlantDatasource {
  static final List<Plant> _categories = [
    const Plant(
      id: 'c1',
      name: 'Snake plant',
      imageUrl: 'assets/images/snake_plant.png',
      height: '18 Inch',
      plantType: 'Succulent',
      rating: 4.7,
      price: 15.99,
      description: "The sansevieria, also known as the snake plant, is hardy and purifies the air. It's ideal for beginners due to its low maintenance.",
    ),
    const Plant(
      id: 'c2',
      name: 'Peace lily',
      imageUrl: 'assets/images/peace_lily.png',
      height: '20 Inch',
      plantType: 'Tropical',
      rating: 4.6,
      price: 18.50,
      description: "The peace lily is known for its white flowers and its ability to thrive indoors in low light.",
    ),
    const Plant(
      id: 'c3',
      name: 'Orchids',
      imageUrl: 'assets/images/orchids.png',
      height: '16 Inch',
      plantType: 'Flowering',
      rating: 4.8,
      price: 24.00,
      description: "Orchids are exotic plants prized for their elegant and long-lasting flowers in a wide variety of colors.",
    ),
  ];

  static final List<Plant> _popular = [
    const Plant(
      id: 'p1',
      name: 'Monstera',
      imageUrl: 'assets/images/monstera_plant.png',
      height: '23 Inch',
      plantType: 'Italian',
      rating: 4.9,
      price: 23.99,
      description: 'Flax, also known as common flax or linseed, is a flowering plant, Linum usitatissimum, in the family Linaceae...',
    ),
    const Plant(
      id: 'p2',
      name: 'Faux Plant',
      imageUrl: 'assets/images/faux_plant.png',
      height: '21 Inch',
      plantType: 'Artificial',
      rating: 4.5,
      price: 19.99,
      description: 'High-quality artificial plant, ideal for decorating without worrying about watering or sunlight.',
    ),
  ];

  Future<List<Plant>> fetchCategories() async {
    await Future.delayed(const Duration(milliseconds: 400));
    return _categories;
  }

  Future<List<Plant>> fetchPopular() async {
    await Future.delayed(const Duration(milliseconds: 400));
    return _popular;
  }
}
