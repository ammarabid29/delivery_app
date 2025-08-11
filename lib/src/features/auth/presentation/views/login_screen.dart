import 'package:delivery_app/src/core/commons/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:delivery_app/src/features/auth/presentation/viewmodels/auth_viewmodel.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({super.key});

  final _authViewModelProvider = ChangeNotifierProvider(
    (ref) => AuthViewmodel(),
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authViewmodel = ref.watch(_authViewModelProvider);
    final emailController = TextEditingController(text: "rider2@mailsac.com");
    final passwordController = TextEditingController(text: "700984");

    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: authViewmodel.isLoading
                  ? null
                  : () async {
                      try {
                        await ref
                            .read(_authViewModelProvider)
                            .login(
                              email: emailController.text,
                              password: passwordController.text,
                              context: context, // 🔴 Pass context here
                            );

                        if (context.mounted) {
                          customSnackBar(
                            context: context,
                            message: 'Login successful',
                            backgroundColor: Colors.green,
                          );
                        }
                      } catch (e) {
                        if (context.mounted) {
                          customSnackBar(
                            context: context,
                            message: e.toString().replaceAll('Exception: ', ''),
                            backgroundColor: Colors.red,
                          );
                        }
                      }
                    },
              child: authViewmodel.isLoading
                  ? const CircularProgressIndicator()
                  : const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
