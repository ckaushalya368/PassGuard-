String checkPasswordStrength(String password) {

  // Check if password is empty
  if (password.isEmpty) {
    return "Please enter a password";
  }

  // Check password requirements
  bool hasUppercase = RegExp(r'[A-Z]').hasMatch(password);
  bool hasLowercase = RegExp(r'[a-z]').hasMatch(password);
  bool hasNumber = RegExp(r'[0-9]').hasMatch(password);
  bool hasSpecialChar =
      RegExp(r'[^a-zA-Z0-9\s]').hasMatch(password);

  int score = 0;

  // Calculate score
  if (hasUppercase) {
    score++;
  }

  if (hasLowercase) {
    score++;
  }

  if (hasNumber) {
    score++;
  }

  if (hasSpecialChar) {
    score++;
  }

  // Determine password strength
  if (password.length < 8) {
    return "Weak";
  } else if (password.length >= 12 && score == 4) {
    return "Strong";
  } else if (score >= 3) {
    return "Medium";
  } else {
    return "Weak";
  }
}