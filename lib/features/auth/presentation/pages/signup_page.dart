import 'package:flutter/material.dart';
import 'package:test/core/theme/app_pallete.dart';
import 'package:test/features/auth/presentation/pages/login_page.dart';
import 'package:test/features/auth/presentation/widgets/auth_field.dart';
import 'package:test/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:test/features/auth/presentation/widgets/auth_special_text.dart';

class SignupPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const SignupPage());
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
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
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _onSignUpPressed() {
    if (_formKey.currentState!.validate()) {
      // Call use case or controller logic
      debugPrint('SignUp: ${nameController.text}, ${emailController.text}');
    }
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                          Icons.app_registration,
                          size: 100,
                          color: Colors.grey,
                        ),
                        const SizedBox(height: 32),
                        const Text(
                          'Sign Up.',
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 32),
                        AuthField(
                          controller: nameController,
                          hintText: 'Name',
                          validator: (value) =>
                              value!.isEmpty ? 'Enter your name' : null,
                          obscureText: false,
                          keyboardType: TextInputType.text,
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
                        AuthGradientButton(
                          title: 'Sign Up',
                          onPressed: _onSignUpPressed,
                        ),
                        const SizedBox(height: 16),
                        AuthSpecialText(
                          title1: 'Already have an account?',
                          title2: 'Sign In',
                          color: AppPallete.gradient2,
                          onTap: () {
                            Navigator.of(context).push(LoginPage.route());
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
