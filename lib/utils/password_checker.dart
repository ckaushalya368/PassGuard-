// Function 01: Check Password Strength
String checkPasswordStrength(String password) {
  if (password.isEmpty) {
    return "Please enter a password";
  }

  //check common passwords
  if (isCommonPassword(password)) {
    return "Weak";
  }

  // Check password requirements
  bool hasUppercase = RegExp(r'[A-Z]').hasMatch(password);
  bool hasLowercase = RegExp(r'[a-z]').hasMatch(password);
  bool hasNumber = RegExp(r'[0-9]').hasMatch(password);
  bool hasSpecialChar = RegExp(r'[^a-zA-Z0-9\s]').hasMatch(password);

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

// Function 02: Generate Password Suggestions
List<String> getPasswordSuggestions(String password) {
  List<String> suggestions = [];

  if (isCommonPassword(password)) {
    suggestions.add("Avoid common passwords and predictable patterns");
  }

  if (password.length < 12) {
    suggestions.add("Use at least 12 characters");
  }

  if (!RegExp(r'[A-Z]').hasMatch(password)) {
    suggestions.add("Add uppercase letters");
  }

  if (!RegExp(r'[a-z]').hasMatch(password)) {
    suggestions.add("Add lowercase letters");
  }

  if (!RegExp(r'[0-9]').hasMatch(password)) {
    suggestions.add("Add numbers");
  }

  if (!RegExp(r'[^a-zA-Z0-9\s]').hasMatch(password)) {
    suggestions.add("Add special characters");
  }

  return suggestions;
}

bool isCommonPassword(String password) {
  Set<String> commonPasswords = {
    "123456",
    "password",
    "password123",
    "password123!",
    "admin123",
    "qwerty123",
    "welcome123",
  };

  return commonPasswords.contains(password.toLowerCase());
}
