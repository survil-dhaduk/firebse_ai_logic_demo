import 'theme/theme_provider.dart';

class ServiceLocator {
  static final ServiceLocator _instance = ServiceLocator._internal();
  factory ServiceLocator() => _instance;
  ServiceLocator._internal();

  final ThemeProvider themeProvider = ThemeProvider();

  // TODO: Add other dependencies like:
  // - Chat service
  // - AI service
  // - Storage service
  // - Network service
}

final serviceLocator = ServiceLocator();
