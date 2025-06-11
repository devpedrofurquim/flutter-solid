import 'package:flutter/material.dart';
import 'package:test/core/theme/app_pallete.dart';
import 'package:test/features/auth/presentation/pages/signup_page.dart';
import 'package:test/features/auth/presentation/widgets/auth_field.dart';
import 'package:test/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:test/features/auth/presentation/widgets/auth_special_text.dart';

class LoginPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const LoginPage());
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  // lifecycle method called once when the stateful widget is inserted into the
  // widget tree. Good for (Start animations, fetch data, initialize controllers and etc...)
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) return;

      // // Await the user's choice
      // final result = await _showChoiceDialog();

      // if (!mounted) return;

      // // Show a snackbar with the selected option
      // _showSnackBar("You selected: $result");
    });
  }

  Future<String?> _showChoiceDialog() {
    return showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Choose an Option'),
        content: const Text('Please select one of the options below:'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop('Option A'),
            child: const Text('Option A'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop('Option B'),
            child: const Text('Option B'),
          ),
        ],
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 2)),
    );
  }
  
  // Lifecycle method for StatefulWidgets. Called when the
  // Widget is removed from the widget tree
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _onSignInPressed() {
    if (_formKey.currentState!.validate()) {
      // Call use case or controller logic
      debugPrint("SignUp: ${emailController.text}");
    }
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.app_registration_outlined,
                          size: 100,
                          color: Colors.grey,
                        ),
                        const SizedBox(height: 32),
                        const Text(
                          'Sign In.',
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        AuthField(
                          controller: emailController,
                          hintText: 'Email',
                          validator: (value) => value!.contains('@')
                              ? null
                              : 'Enter a valid email',
                          obscureText: false,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 16),
                        AuthField(
                          controller: passwordController,
                          hintText: 'Password',
                          obscureText: true,
                          validator: (value) =>
                              value!.length >= 6 ? null : 'Min 6 chars',
                          keyboardType: TextInputType.visiblePassword,
                        ),
                        const SizedBox(height: 24),
                        AuthGradientButton(title: 'Sign In', onPressed: _onSignInPressed,),
                        const SizedBox(height: 16),
                        AuthSpecialText(
                          title1: 'Don\'t have an account?',
                          title2: 'Sign Up',
                          color: AppPallete.gradient2,
                          onTap: () {
                            Navigator.of(context).push(SignupPage.route());
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
