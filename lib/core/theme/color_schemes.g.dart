import 'package:flutter/material.dart';

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,

  // Colores principales
  primary: Color(0xff131a22), // Color principal de la interfaz
  onPrimary:
      Color.fromARGB(255, 255, 255, 255), // Texto sobre el color principal
  primaryContainer:
      Color(0xffFFD54B), // Contenedor principal (fondos, tarjetas, etc.)
  onPrimaryContainer: Color(0xFF410002), // Texto sobre el contenedor principal

  // Colores secundarios
  secondary:
      Color.fromARGB(255, 144, 0, 255), // Color secundario de la interfaz
  onSecondary: Color(0xFFFFFFFF), // Texto sobre el color secundario
  secondaryContainer: Color.fromARGB(
      255, 255, 0, 221), // Contenedor secundario (fondos, tarjetas, etc.)
  onSecondaryContainer:
      Color(0xFF3E001D), // Texto sobre el contenedor secundario

  // Colores terciarios
  tertiary: Color.fromARGB(255, 255, 0, 242),
  onTertiary: Color.fromARGB(255, 0, 255, 55),
  tertiaryContainer: Color.fromARGB(255, 0, 255, 21),
  onTertiaryContainer: Color(0xFF001F24),

  // Colores de error
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),

  // Colores de fondo y superficie
  background: Color(0xff131a22),
  onBackground: Color.fromARGB(255, 255, 0, 0), // Texto sobre el fondo
  surface: Color(0xff131a22), // Color de los botones
  onSurface: Color(0xff131a22), // Texto sobre la superficie
  surfaceVariant: Color(0xFFF5DDDA),
  onSurfaceVariant: Color(0xFF534341),

  // Otros colores
  outline: Color.fromARGB(91, 0, 203, 14),
  onInverseSurface: Color(0xffFFD54B),
  inverseSurface: Color(0xff131a22),
  inversePrimary: Color.fromARGB(255, 4, 255, 0),
  shadow: Color(0xff131a22),
  surfaceTint: Color.fromARGB(255, 13, 0, 255),
  outlineVariant: Color.fromARGB(255, 255, 0, 195),
  scrim: Color.fromARGB(255, 255, 0, 123),
);

// const darkColorScheme = ColorScheme(
//   brightness: Brightness.dark,
//   primary: Color(0xFFFFB4AB),
//   onPrimary: Color(0xFF690005),
//   primaryContainer: Color(0xFF93000A),
//   onPrimaryContainer: Color(0xFFFFDAD6),
//   secondary: Color(0xFFFFB1C8),
//   onSecondary: Color(0xFF5E1133),
//   secondaryContainer: Color(0xFF7B2949),
//   onSecondaryContainer: Color(0xFFFFD9E2),
//   tertiary: Color(0xFF50D8EC),
//   onTertiary: Color(0xFF00363D),
//   tertiaryContainer: Color(0xFF004F58),
//   onTertiaryContainer: Color(0xFF9BF0FF),
//   error: Color(0xFFFFB4AB),
//   errorContainer: Color(0xFF93000A),
//   onError: Color(0xFF690005),
//   onErrorContainer: Color(0xFFFFDAD6),
//   background: Color(0xFF201A19),
//   onBackground: Color(0xFFEDE0DE),
//   surface: Color(0xFF201A19),
//   onSurface: Color(0xFFEDE0DE),
//   surfaceVariant: Color(0xFF534341),
//   onSurfaceVariant: Color(0xFFD8C2BF),
//   outline: Color(0xFFA08C8A),
//   onInverseSurface: Color(0xFF201A19),
//   inverseSurface: Color(0xFFEDE0DE),
//   inversePrimary: Color(0xFFB7211E),
//   shadow: Color(0xFF000000),
//   surfaceTint: Color(0xFFFFB4AB),
//   outlineVariant: Color(0xFF534341),
//   scrim: Color(0xFF000000),
// );
