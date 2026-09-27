import 'package:plant_app/domain/entities/plant.dart';
import 'package:plant_app/domain/repositories/plant_repository.dart';
import 'package:plant_app/infrastructure/datasources/local_plant_datasource.dart';

class PlantRespositoryImpl implements PlantRepository {
  final LocalPlantDatasource datasource;

  PlantRespositoryImpl({LocalPlantDatasource? datasource})
    : datasource = datasource ?? LocalPlantDatasource();

  @override
  Future<List<Plant>> getCategories() async {
    return await datasource.fetchCategories();
  }

  @override
  Future<List<Plant>> getPopular() async {
    return await datasource.fetchPopular();
  }
}
