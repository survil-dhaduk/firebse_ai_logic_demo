import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_styles.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.primary,
        onPrimary: AppColors.onPrimary,
        primaryContainer: AppColors.primaryContainer,
        onPrimaryContainer: AppColors.onPrimaryContainer,
        secondary: AppColors.secondary,
        onSecondary: AppColors.onSecondary,
        secondaryContainer: AppColors.secondaryContainer,
        onSecondaryContainer: AppColors.onSecondaryContainer,
        tertiary: AppColors.tertiary,
        onTertiary: AppColors.onTertiary,
        tertiaryContainer: AppColors.tertiaryContainer,
        onTertiaryContainer: AppColors.onTertiaryContainer,
        error: AppColors.error,
        onError: AppColors.onError,
        errorContainer: AppColors.errorContainer,
        onErrorContainer: AppColors.onErrorContainer,
        surface: AppColors.surface,
        onSurface: AppColors.onSurface,
        surfaceVariant: AppColors.surfaceVariant,
        onSurfaceVariant: AppColors.onSurfaceVariant,
        outline: AppColors.outline,
        outlineVariant: AppColors.outlineVariant,
        background: AppColors.background,
        onBackground: AppColors.onBackground,
        shadow: AppColors.shadow,
        scrim: AppColors.shadow,
        inverseSurface: AppColors.onBackground,
        onInverseSurface: AppColors.background,
        inversePrimary: AppColors.primaryContainer,
        surfaceTint: AppColors.primary,
      ),
      textTheme: TextTheme(
        displayLarge: AppStyles.displayLarge,
        displayMedium: AppStyles.displayMedium,
        displaySmall: AppStyles.displaySmall,
        headlineLarge: AppStyles.headlineLarge,
        headlineMedium: AppStyles.headlineMedium,
        headlineSmall: AppStyles.headlineSmall,
        titleLarge: AppStyles.titleLarge,
        titleMedium: AppStyles.titleMedium,
        titleSmall: AppStyles.titleSmall,
        bodyLarge: AppStyles.bodyLarge,
        bodyMedium: AppStyles.bodyMedium,
        bodySmall: AppStyles.bodySmall,
        labelLarge: AppStyles.labelLarge,
        labelMedium: AppStyles.labelMedium,
        labelSmall: AppStyles.labelSmall,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.onSurface,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.onSurface,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: AppStyles.primaryButtonStyle,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.inputBackground,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppStyles.radius12),
          borderSide: const BorderSide(color: AppColors.inputBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppStyles.radius12),
          borderSide: const BorderSide(color: AppColors.inputBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppStyles.radius12),
          borderSide: const BorderSide(
            color: AppColors.inputFocusedBorder,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppStyles.radius12),
          borderSide: const BorderSide(color: AppColors.error),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppStyles.spacing16,
          vertical: AppStyles.spacing12,
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppStyles.radius12),
        ),
        shadowColor: AppColors.shadow,
      ),
      scaffoldBackgroundColor: AppColors.background,
      dividerTheme: const DividerThemeData(
        color: AppColors.outlineVariant,
        thickness: 1,
        space: 1,
      ),
      iconTheme: const IconThemeData(
        color: AppColors.onSurfaceVariant,
        size: 24,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimary,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppStyles.radius16)),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: AppColors.primary,
        onPrimary: AppColors.onPrimary,
        primaryContainer: AppColors.primaryContainer,
        onPrimaryContainer: AppColors.onPrimaryContainer,
        secondary: AppColors.secondary,
        onSecondary: AppColors.onSecondary,
        secondaryContainer: AppColors.secondaryContainer,
        onSecondaryContainer: AppColors.onSecondaryContainer,
        tertiary: AppColors.tertiary,
        onTertiary: AppColors.onTertiary,
        tertiaryContainer: AppColors.tertiaryContainer,
        onTertiaryContainer: AppColors.onTertiaryContainer,
        error: AppColors.error,
        onError: AppColors.onError,
        errorContainer: AppColors.errorContainer,
        onErrorContainer: AppColors.onErrorContainer,
        surface: Color(0xFF1C1B1F),
        onSurface: Color(0xFFE6E1E5),
        surfaceVariant: Color(0xFF49454F),
        onSurfaceVariant: Color(0xFFCAC4D0),
        outline: Color(0xFF938F99),
        outlineVariant: Color(0xFF49454F),
        background: Color(0xFF1C1B1F),
        onBackground: Color(0xFFE6E1E5),
        shadow: AppColors.shadow,
        scrim: AppColors.shadow,
        inverseSurface: Color(0xFFE6E1E5),
        onInverseSurface: Color(0xFF1C1B1F),
        inversePrimary: AppColors.primaryContainer,
        surfaceTint: AppColors.primary,
      ),
      textTheme: TextTheme(
        displayLarge: AppStyles.displayLarge.copyWith(
          color: const Color(0xFFE6E1E5),
        ),
        displayMedium: AppStyles.displayMedium.copyWith(
          color: const Color(0xFFE6E1E5),
        ),
        displaySmall: AppStyles.displaySmall.copyWith(
          color: const Color(0xFFE6E1E5),
        ),
        headlineLarge: AppStyles.headlineLarge.copyWith(
          color: const Color(0xFFE6E1E5),
        ),
        headlineMedium: AppStyles.headlineMedium.copyWith(
          color: const Color(0xFFE6E1E5),
        ),
        headlineSmall: AppStyles.headlineSmall.copyWith(
          color: const Color(0xFFE6E1E5),
        ),
        titleLarge: AppStyles.titleLarge.copyWith(
          color: const Color(0xFFE6E1E5),
        ),
        titleMedium: AppStyles.titleMedium.copyWith(
          color: const Color(0xFFE6E1E5),
        ),
        titleSmall: AppStyles.titleSmall.copyWith(
          color: const Color(0xFFCAC4D0),
        ),
        bodyLarge: AppStyles.bodyLarge.copyWith(color: const Color(0xFFE6E1E5)),
        bodyMedium: AppStyles.bodyMedium.copyWith(
          color: const Color(0xFFE6E1E5),
        ),
        bodySmall: AppStyles.bodySmall.copyWith(color: const Color(0xFFCAC4D0)),
        labelLarge: AppStyles.labelLarge.copyWith(
          color: const Color(0xFFE6E1E5),
        ),
        labelMedium: AppStyles.labelMedium.copyWith(
          color: const Color(0xFFCAC4D0),
        ),
        labelSmall: AppStyles.labelSmall.copyWith(
          color: const Color(0xFFCAC4D0),
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF1C1B1F),
        foregroundColor: Color(0xFFE6E1E5),
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Color(0xFFE6E1E5),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: AppStyles.primaryButtonStyle,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF2B2930),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppStyles.radius12),
          borderSide: const BorderSide(color: AppColors.inputBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppStyles.radius12),
          borderSide: const BorderSide(color: AppColors.inputBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppStyles.radius12),
          borderSide: const BorderSide(
            color: AppColors.inputFocusedBorder,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppStyles.radius12),
          borderSide: const BorderSide(color: AppColors.error),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppStyles.spacing16,
          vertical: AppStyles.spacing12,
        ),
      ),
      cardTheme: CardThemeData(
        color: const Color(0xFF2B2930),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppStyles.radius12),
        ),
        shadowColor: AppColors.shadow,
      ),
      scaffoldBackgroundColor: const Color(0xFF1C1B1F),
      dividerTheme: const DividerThemeData(
        color: Color(0xFF49454F),
        thickness: 1,
        space: 1,
      ),
      iconTheme: const IconThemeData(color: Color(0xFFCAC4D0), size: 24),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimary,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppStyles.radius16)),
        ),
      ),
    );
  }
}
