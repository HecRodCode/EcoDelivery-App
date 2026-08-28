import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/theme/app_theme.dart';
import 'features/auth/application/auth_controller.dart';
import 'features/auth/presentation/mappers/auth_exception_x.dart';
import 'features/auth/presentation/screens/login_screen.dart';
import 'features/pedidos/presentation/screens/order_list_screen.dart';

void main() {
  runApp(const ProviderScope(child: EcoDeliveryApp()));
}

class EcoDeliveryApp extends StatelessWidget {
  const EcoDeliveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoDelivery',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const AuthGate(),
    );
  }
}

class AuthGate extends ConsumerWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);

    return switch (authState) {
      AsyncData(:final value) => value == null ? const LoginScreen() : const OrderListScreen(),
      AsyncError(:final error) => _StartupErrorScreen(
          message: authErrorMessage(error),
          onRetry: () => ref.invalidate(authControllerProvider),
        ),
      _ => const _SplashScreen(),
    };
  }
}

class _SplashScreen extends StatelessWidget {
  const _SplashScreen();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}

class _StartupErrorScreen extends StatelessWidget {
  const _StartupErrorScreen({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error_outline, color: Theme.of(context).colorScheme.error, size: 40),
            const SizedBox(height: 8),
            Text(message, textAlign: TextAlign.center),
            const SizedBox(height: 8),
            ElevatedButton(onPressed: onRetry, child: const Text('Reintentar')),
          ],
        ),
      ),
    );
  }
}
