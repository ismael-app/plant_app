import 'package:plant_app/domain/entities/plant.dart';

abstract class PlantRepository {
  Future<List<Plant>> getCategories();
  Future<List<Plant>> getPopular();
}
