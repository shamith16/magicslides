import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/auth_provider.dart';
import '../../core/error_handler.dart';
import '../home/home_view.dart';
import 'login_view.dart';
import 'widgets/auth_form_field.dart';
import 'widgets/auth_submit_button.dart';

class SignupView extends ConsumerStatefulWidget {
  const SignupView({super.key});

  @override
  ConsumerState<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends ConsumerState<SignupView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  ProviderSubscription<AsyncValue<void>>? _authListener;
  bool _hasNavigated = false;

  @override
  void initState() {
    super.initState();
    _authListener = ref.listenManual<AsyncValue<void>>(
      authProvider,
      (previous, next) {
      if (next.hasError && next.error != previous?.error) {
          showErrorToast(next.error!);
        } else if (next.hasValue && (previous?.isLoading ?? false)) {
          _navigateToHome();
        }
      },
      fireImmediately: false,
          );
  }

  @override
  void dispose() {
    _authListener?.close();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _navigateToHome() {
    if (!mounted || _hasNavigated) return;
    _hasNavigated = true;
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const HomeView()),
      (route) => false,
    );
  }

  Future<void> _signup() async {
    if (_formKey.currentState!.validate()) {
      _hasNavigated = false;
      await ref
          .read(authProvider.notifier)
          .signup(_emailController.text.trim(), _passwordController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    final isLoading = authState.isLoading;

    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AuthFormField(
                controller: _emailController,
                labelText: 'Email',
                keyboardType: TextInputType.emailAddress,
                enabled: !isLoading,
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter email'
                    : null,
              ),
              const SizedBox(height: 16),
              AuthFormField(
                controller: _passwordController,
                labelText: 'Password',
                obscureText: true,
                enabled: !isLoading,
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter password'
                    : null,
              ),
              const SizedBox(height: 16),
              AuthFormField(
                controller: _confirmPasswordController,
                labelText: 'Confirm Password',
                obscureText: true,
                enabled: !isLoading,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm password';
                  }
                  if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              AuthSubmitButton(
                isLoading: isLoading,
                text: 'Sign Up',
                onPressed: _signup,
              ),
              TextButton(
                onPressed: isLoading
                    ? null
                    : () {
                  Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const LoginView(),
                          ),
                  );
                },
                child: const Text('Already have an account? Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
