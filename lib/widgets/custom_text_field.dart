import 'package:flutter/material.dart';
import 'package:dsw60330/utils/colors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    required this.hint,
    required this.icon,
    required this.controller,
    this.isPassword = false,
    this.validator,
    this.keyboardType,
    super.key,
  });

  final String hint;
  final IconData icon;
  final TextEditingController controller;
  final bool isPassword;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscure = widget.isPassword;

  OutlineInputBorder _border(Color color) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(color: color),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscure,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      style: const TextStyle(fontSize: 14),
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: const TextStyle(color: AppColors.hint, fontSize: 12),
        prefixIcon: Icon(widget.icon, color: AppColors.dark, size: 20),
        suffixIcon: widget.isPassword
            ? IconButton(
          icon: Icon(
            _obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined,
            size: 18,
          ),
          onPressed: () => setState(() => _obscure = !_obscure),
        )
            : null,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 14),
        errorStyle: const TextStyle(color: Colors.red, fontSize: 11),
        enabledBorder: _border(AppColors.border),
        focusedBorder: _border(AppColors.dark),
        errorBorder: _border(Colors.red),
        focusedErrorBorder: _border(Colors.red),
      ),
    );
  }
}