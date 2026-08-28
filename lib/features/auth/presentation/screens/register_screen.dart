import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/auth_controller.dart';
import '../../domain/entities/user_role.dart';
import '../mappers/auth_exception_x.dart';
import '../mappers/user_role_x.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  UserRole? _role;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    ref.read(authControllerProvider.notifier).register(
          email: _emailController.text.trim(),
          password: _passwordController.text,
          role: _role!,
        );
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);
    final isLoading = authState.isLoading;

    ref.listen(authControllerProvider, (previous, next) {
      if (next.hasError && next is! AsyncLoading) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(authErrorMessage(next.error!))),
        );
      } else if (previous?.isLoading == true && next.hasValue && next.value != null) {
        Navigator.of(context).pop();
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Crear cuenta')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Correo',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    (value == null || value.trim().isEmpty) ? 'El correo es requerido' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => (value == null || value.length < 6)
                    ? 'Mínimo 6 caracteres'
                    : null,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<UserRole>(
                initialValue: _role,
                decoration: const InputDecoration(
                  labelText: 'Tipo de usuario',
                  border: OutlineInputBorder(),
                ),
                items: UserRole.values
                    .map((role) => DropdownMenuItem(value: role, child: Text(role.label)))
                    .toList(),
                onChanged: (value) => setState(() => _role = value),
                validator: (value) => value == null ? 'Selecciona un tipo de usuario' : null,
              ),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: isLoading ? null : _submit,
                child: isLoading
                    ? const SizedBox(
                        height: 16,
                        width: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Registrarme'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
