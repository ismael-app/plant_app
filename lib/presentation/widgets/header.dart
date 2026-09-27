import 'package:flutter/material.dart';
import 'package:plant_app/config/theme/app_colors.dart';

class Header extends StatelessWidget {
  final String userName;
  final String avatar;

  const Header({super.key, required this.userName, required this.avatar});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(backgroundImage: AssetImage(avatar), radius: 25.0),
        const SizedBox(width: 15.0),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                const TextSpan(text: 'Hello, \n'),
                TextSpan(
                  text: '$userName!',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ],
              style: const TextStyle(fontSize: 18.0, color: Colors.black87),
            ),
          ),
        ),

        Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(15.0),
              decoration: const BoxDecoration(
                color: AppColors.card,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.notifications_none),
            ),

            Positioned(
              top: 2,
              right: 2,
              child: Container(
                width: 10.0,
                height: 10.0,
                decoration: const BoxDecoration(
                  color: Color(0xFFFF3535),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
