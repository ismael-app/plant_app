import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_app/config/theme/app_colors.dart';
import 'package:plant_app/presentation/screens/main_screen.dart';

void main() {
  // 2. Asegura que los servicios de Flutter estén listos
  WidgetsFlutterBinding.ensureInitialized();

  // 3. Aplica la configuración de la barra de estado
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white, // Fondo blanco en Android
      statusBarIconBrightness:
          Brightness.dark, // Íconos oscuros (hora, wifi) en Android
      statusBarBrightness:
          Brightness.light, // Asegura el comportamiento correcto en iOS

      systemStatusBarContrastEnforced:
          false, // Desactiva el filtro/sombra oscuro en Android
    ),
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plant App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.outfitTextTheme(),
        colorSchemeSeed: AppColors.primary,
      ),
      home: const MainScreen(),
    );
  }
}
