import 'package:flutter/material.dart';
import 'package:dsw60330/screens/home_screen.dart';
import 'package:dsw60330/screens/sign_up_screen.dart';
import 'package:dsw60330/services/auth_service.dart';
import 'package:dsw60330/utils/colors.dart';
import 'package:dsw60330/utils/validators.dart';
import 'package:dsw60330/widgets/custom_text_field.dart';
import 'package:dsw60330/widgets/primary_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  String? _loginError;

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  Future<void> _signIn() async {
    setState(() => _loginError = null);
    if (!_formKey.currentState!.validate()) return;
    if (AuthService.checkCredentials(_emailCtrl.text, _passCtrl.text)) {
      await AuthService.setLoggedIn(value: true);
      if (!mounted) return;
      await Navigator.pushReplacement(
        context,
        MaterialPageRoute<void>(builder: (_) => const HomeScreen()),
      );
    } else {
      setState(() => _loginError = 'Invalid email or password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Center(
                  child: Image.asset(
                    'assets/logo.png',
                    height: 120,
                    errorBuilder: (_, __, ___) => const Icon(
                      Icons.phone_android,
                      size: 80,
                      color: AppColors.dark,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Sign in',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.dark,
                  ),
                ),
                const SizedBox(height: 24),
                CustomTextField(
                  hint: 'Email or User Name',
                  icon: Icons.person_outline,
                  controller: _emailCtrl,
                  validator: validateEmail,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  hint: 'Password',
                  icon: Icons.lock_outline,
                  controller: _passCtrl,
                  isPassword: true,
                  validator: validatePassword,
                ),
                const SizedBox(height: 12),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forget Password ?',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: AppColors.dark,
                    ),
                  ),
                ),
                if (_loginError != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      _loginError!,
                      style: const TextStyle(color: Colors.red, fontSize: 11),
                    ),
                  ),
                const SizedBox(height: 24),
                PrimaryButton(text: 'Sign in', onPressed: _signIn),
                const SizedBox(height: 80),
                Center(
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute<void>(builder: (_) => const SignUpScreen()),
                    ),
                    child: const Text.rich(
                      TextSpan(
                        text: "Don't have an account ? ",
                        style: TextStyle(fontSize: 11, color: AppColors.dark),
                        children: [
                          TextSpan(
                            text: 'Sign Up',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}