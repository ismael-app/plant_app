import 'package:flutter/material.dart';
import 'package:plant_app/config/theme/app_colors.dart';
import 'package:plant_app/domain/entities/plant.dart';

class PlantCard extends StatelessWidget {
  final Plant plant;
  final VoidCallback onTap;
  final bool showName;

  const PlantCard({
    super.key,
    required this.plant,
    required this.onTap,
    this.showName = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10.0,
              offset: const Offset(0, 4),
            ),
          ],
        ),

        child: Column(
          children: [
            Expanded(
              child: Image(
                image: AssetImage(plant.imageUrl),
                fit: BoxFit.contain,
              ),
            ),

            if (showName) ...[
              const SizedBox(height: 10.0),

              Text(
                plant.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 15.0,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
