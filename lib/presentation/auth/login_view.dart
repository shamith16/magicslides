import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/auth_provider.dart';
import '../../core/error_handler.dart';
import 'signup_view.dart';
import '../home/home_view.dart';
import 'widgets/auth_form_field.dart';
import 'widgets/auth_submit_button.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  ProviderSubscription<AsyncValue<void>>? _authListener;
  bool _hasNavigated = false;

  @override
  void initState() {
    super.initState();
    _authListener = ref.listenManual<AsyncValue<void>>(authProvider, (
      previous,
      next,
    ) {
      if (next.hasError && next.error != previous?.error) {
        showErrorToast(next.error!);
      } else if (next.hasValue && (previous?.isLoading ?? false)) {
        _navigateToHome();
      }
    }, fireImmediately: false);
  }

  @override
  void dispose() {
    _authListener?.close();
    _emailController.dispose();
    _passwordController.dispose();
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

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      _hasNavigated = false;
      await ref
          .read(authProvider.notifier)
          .login(_emailController.text.trim(), _passwordController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    final isLoading = authState.isLoading;

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
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
              const SizedBox(height: 24),
              AuthSubmitButton(
                isLoading: isLoading,
                text: 'Login',
                onPressed: _login,
              ),
              TextButton(
                onPressed: isLoading
                    ? null
                    : () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const SignupView(),
                          ),
                        );
                      },
                child: const Text('Don\'t have an account? Sign up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
