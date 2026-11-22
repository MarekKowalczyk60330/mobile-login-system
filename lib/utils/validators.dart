String? validateEmail(String? value) {
  final v = value?.trim() ?? '';
  final regex = RegExp(r'^[\w.+-]+@[\w-]+\.[\w.-]+$');
  return regex.hasMatch(v) ? null : 'Invalid email';
}

String? validatePassword(String? value) {
  if (value == null || value.length < 6) {
    return 'Password must have at least 6 characters';
  }
  return null;
}

String? validateName(String? value) {
  if (value == null || value.trim().isEmpty) return 'Enter your name';
  return null;
}