import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff78590c),
      surfaceTint: Color(0xff78590c),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffffdea1),
      onPrimaryContainer: Color(0xff5c4300),
      secondary: Color(0xff7c4e7e),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffffd6fc),
      onSecondaryContainer: Color(0xff623765),
      tertiary: Color(0xff006874),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff9eeffe),
      onTertiaryContainer: Color(0xff004f58),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffff8f2),
      onSurface: Color(0xff1f1b13),
      onSurfaceVariant: Color(0xff4d4639),
      outline: Color(0xff7f7667),
      outlineVariant: Color(0xffd0c5b4),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff353027),
      inversePrimary: Color(0xffeac16c),
      primaryFixed: Color(0xffffdea1),
      onPrimaryFixed: Color(0xff261900),
      primaryFixedDim: Color(0xffeac16c),
      onPrimaryFixedVariant: Color(0xff5c4300),
      secondaryFixed: Color(0xffffd6fc),
      onSecondaryFixed: Color(0xff310936),
      secondaryFixedDim: Color(0xffecb4eb),
      onSecondaryFixedVariant: Color(0xff623765),
      tertiaryFixed: Color(0xff9eeffe),
      onTertiaryFixed: Color(0xff001f24),
      tertiaryFixedDim: Color(0xff82d3e1),
      onTertiaryFixedVariant: Color(0xff004f58),
      surfaceDim: Color(0xffe2d9cc),
      surfaceBright: Color(0xfffff8f2),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffdf2e5),
      surfaceContainer: Color(0xfff7ecdf),
      surfaceContainerHigh: Color(0xfff1e7d9),
      surfaceContainerHighest: Color(0xffebe1d4),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff473300),
      surfaceTint: Color(0xff78590c),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff89681c),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff502653),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff8c5c8e),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff003c44),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff197885),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f2),
      onSurface: Color(0xff151109),
      onSurfaceVariant: Color(0xff3c3529),
      outline: Color(0xff595144),
      outlineVariant: Color(0xff756c5d),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff353027),
      inversePrimary: Color(0xffeac16c),
      primaryFixed: Color(0xff89681c),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff6d5000),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff8c5c8e),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff724474),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff197885),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff005e69),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffcfc5b8),
      surfaceBright: Color(0xfffff8f2),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffdf2e5),
      surfaceContainer: Color(0xfff1e7d9),
      surfaceContainerHigh: Color(0xffe5dbce),
      surfaceContainerHighest: Color(0xffdad0c3),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff3b2900),
      surfaceTint: Color(0xff78590c),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff5f4500),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff441b48),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff653968),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff003138),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff00515b),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f2),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff322b1f),
      outlineVariant: Color(0xff50483b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff353027),
      inversePrimary: Color(0xffeac16c),
      primaryFixed: Color(0xff5f4500),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff432f00),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff653968),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff4c224f),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff00515b),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff003940),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc1b7ab),
      surfaceBright: Color(0xfffff8f2),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffaefe2),
      surfaceContainer: Color(0xffebe1d4),
      surfaceContainerHigh: Color(0xffddd3c6),
      surfaceContainerHighest: Color(0xffcfc5b8),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffeac16c),
      surfaceTint: Color(0xffeac16c),
      onPrimary: Color(0xff402d00),
      primaryContainer: Color(0xff5c4300),
      onPrimaryContainer: Color(0xffffdea1),
      secondary: Color(0xffecb4eb),
      onSecondary: Color(0xff49204d),
      secondaryContainer: Color(0xff623765),
      onSecondaryContainer: Color(0xffffd6fc),
      tertiary: Color(0xff82d3e1),
      onTertiary: Color(0xff00363d),
      tertiaryContainer: Color(0xff004f58),
      onTertiaryContainer: Color(0xff9eeffe),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff17130b),
      onSurface: Color(0xffebe1d4),
      onSurfaceVariant: Color(0xffd0c5b4),
      outline: Color(0xff998f80),
      outlineVariant: Color(0xff4d4639),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffebe1d4),
      inversePrimary: Color(0xff78590c),
      primaryFixed: Color(0xffffdea1),
      onPrimaryFixed: Color(0xff261900),
      primaryFixedDim: Color(0xffeac16c),
      onPrimaryFixedVariant: Color(0xff5c4300),
      secondaryFixed: Color(0xffffd6fc),
      onSecondaryFixed: Color(0xff310936),
      secondaryFixedDim: Color(0xffecb4eb),
      onSecondaryFixedVariant: Color(0xff623765),
      tertiaryFixed: Color(0xff9eeffe),
      onTertiaryFixed: Color(0xff001f24),
      tertiaryFixedDim: Color(0xff82d3e1),
      onTertiaryFixedVariant: Color(0xff004f58),
      surfaceDim: Color(0xff17130b),
      surfaceBright: Color(0xff3e382f),
      surfaceContainerLowest: Color(0xff120e07),
      surfaceContainerLow: Color(0xff1f1b13),
      surfaceContainer: Color(0xff241f17),
      surfaceContainerHigh: Color(0xff2e2921),
      surfaceContainerHighest: Color(0xff39342b),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffd788),
      surfaceTint: Color(0xffeac16c),
      onPrimary: Color(0xff322300),
      primaryContainer: Color(0xffb08b3d),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffffccfd),
      onSecondary: Color(0xff3d1541),
      secondaryContainer: Color(0xffb380b3),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xff98e9f7),
      onTertiary: Color(0xff002a30),
      tertiaryContainer: Color(0xff499caa),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff17130b),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffe7dbc9),
      outline: Color(0xffbbb0a0),
      outlineVariant: Color(0xff998f7f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffebe1d4),
      inversePrimary: Color(0xff5d4400),
      primaryFixed: Color(0xffffdea1),
      onPrimaryFixed: Color(0xff191000),
      primaryFixedDim: Color(0xffeac16c),
      onPrimaryFixedVariant: Color(0xff473300),
      secondaryFixed: Color(0xffffd6fc),
      onSecondaryFixed: Color(0xff25002b),
      secondaryFixedDim: Color(0xffecb4eb),
      onSecondaryFixedVariant: Color(0xff502653),
      tertiaryFixed: Color(0xff9eeffe),
      onTertiaryFixed: Color(0xff001417),
      tertiaryFixedDim: Color(0xff82d3e1),
      onTertiaryFixedVariant: Color(0xff003c44),
      surfaceDim: Color(0xff17130b),
      surfaceBright: Color(0xff4a443a),
      surfaceContainerLowest: Color(0xff0a0703),
      surfaceContainerLow: Color(0xff211d15),
      surfaceContainer: Color(0xff2c271f),
      surfaceContainerHigh: Color(0xff373229),
      surfaceContainerHighest: Color(0xff433d34),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffeed2),
      surfaceTint: Color(0xffeac16c),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffe6bd69),
      onPrimaryContainer: Color(0xff110a00),
      secondary: Color(0xffffeafa),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffe8b0e7),
      onSecondaryContainer: Color(0xff1b0020),
      tertiary: Color(0xffcef7ff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xff7ecfdd),
      onTertiaryContainer: Color(0xff000e10),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff17130b),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xfffbeedc),
      outlineVariant: Color(0xffcdc1b0),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffebe1d4),
      inversePrimary: Color(0xff5d4400),
      primaryFixed: Color(0xffffdea1),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffeac16c),
      onPrimaryFixedVariant: Color(0xff191000),
      secondaryFixed: Color(0xffffd6fc),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffecb4eb),
      onSecondaryFixedVariant: Color(0xff25002b),
      tertiaryFixed: Color(0xff9eeffe),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xff82d3e1),
      onTertiaryFixedVariant: Color(0xff001417),
      surfaceDim: Color(0xff17130b),
      surfaceBright: Color(0xff554f45),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff241f17),
      surfaceContainer: Color(0xff353027),
      surfaceContainerHigh: Color(0xff403b31),
      surfaceContainerHighest: Color(0xff4c463c),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
