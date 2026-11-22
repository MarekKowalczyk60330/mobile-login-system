import 'package:flutter/material.dart';
import 'package:dsw60330/utils/colors.dart';
import 'package:dsw60330/utils/validators.dart';
import 'package:dsw60330/widgets/custom_text_field.dart';
import 'package:dsw60330/widgets/primary_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  final _confirmCtrl = TextEditingController();

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _passCtrl.dispose();
    _confirmCtrl.dispose();
    super.dispose();
  }

  void _signUp() {
    if (!_formKey.currentState!.validate()) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Account created. Please sign in.')),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: -40,
            right: -40,
            child: Container(
              width: 110,
              height: 110,
              decoration: const BoxDecoration(
                color: AppColors.light,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: -60,
            right: 20,
            child: Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                color: AppColors.dark,
                shape: BoxShape.circle,
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.arrow_back_ios, size: 12, color: AppColors.dark),
                          Text(
                            'Back',
                            style: TextStyle(fontSize: 11, color: AppColors.dark),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 60),
                    const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.dark,
                      ),
                    ),
                    const SizedBox(height: 24),
                    CustomTextField(
                      hint: 'Full Name',
                      icon: Icons.person_outline,
                      controller: _nameCtrl,
                      validator: validateName,
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      hint: 'Email',
                      icon: Icons.mail_outline,
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
                    const SizedBox(height: 20),
                    CustomTextField(
                      hint: 'Confirm Password',
                      icon: Icons.lock_outline,
                      controller: _confirmCtrl,
                      isPassword: true,
                      validator: (v) =>
                      v != _passCtrl.text ? 'Passwords do not match' : null,
                    ),
                    const SizedBox(height: 40),
                    PrimaryButton(text: 'Sign Up', onPressed: _signUp),
                    const SizedBox(height: 60),
                    Center(
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Text.rich(
                          TextSpan(
                            text: 'Already have an account ? ',
                            style: TextStyle(fontSize: 11, color: AppColors.dark),
                            children: [
                              TextSpan(
                                text: 'Sing In',
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
        ],
      ),
    );
  }
}