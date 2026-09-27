import 'package:flutter/material.dart';
import 'package:plant_app/config/theme/app_colors.dart';
import 'package:plant_app/domain/entities/plant.dart';
import 'package:plant_app/presentation/widgets/plant_card.dart';

class PlantDetailScreen extends StatelessWidget {
  final Plant plant;

  const PlantDetailScreen({super.key, required this.plant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: const BoxDecoration(
                        color: AppColors.card,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.arrow_back, size: 25.0),
                    ),
                  ),

                  const Text(
                    'Details',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),

                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: const BoxDecoration(
                        color: AppColors.card,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.share_outlined, size: 25.0),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20.0),

              Stack(
                clipBehavior: Clip.none,
                children: [
                  SizedBox(
                    height: 380,
                    width: double.infinity,

                    child: PlantCard(
                      plant: plant,
                      showName: false,
                      onTap: () {},
                    ),
                  ),

                  Positioned(
                    bottom: -75,
                    left: 0,
                    right: 0,
                    child: SizedBox(
                      height: 95,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Expanded(
                            child: _buildInfoCard(
                              label: 'Height',
                              value: plant.height,
                            ),
                          ),

                          const SizedBox(width: 10.0),

                          Expanded(
                            child: _buildInfoCard(
                              label: 'Plant',
                              value: plant.plantType,
                            ),
                          ),

                          const SizedBox(width: 10.0),

                          Expanded(
                            child: _buildInfoCard(
                              label: 'Ratng',
                              value: plant.rating.toString(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // ClipRRect(
                  //   borderRadius: BorderRadius.circular(24.0),
                  //   child: Image(image: AssetImage(plant.imageUrl)),
                  // ),
                  // Container(
                  //   child: PlantCard(
                  //     plant: plant,
                  //     showName: false,
                  //     onTap: () {},
                  //   ),
                  // ),
                ],
              ),

              const SizedBox(height: 80),

              Text(
                plant.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    plant.description,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),

              SizedBox(
                width: double.infinity,
                height: 65,
                child: ElevatedButton(
                  onPressed: () => {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                  ),
                  child: Text(
                    'Buy Now - \$${plant.price.toStringAsFixed(2)}',
                    style: const TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard({required String label, required String value}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .04),
            blurRadius: 12.0,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 4.0),

          Text(
            value,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
