class ValidatorsPassword {
  static String? email(String? value) {
    final emailValue = value?.trim();
    if (emailValue == null || emailValue.isEmpty) {
      return 'Campo de e-mail obrigatorio';
    }

    final validadorEmail = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!validadorEmail.hasMatch(emailValue)) {
      return 'E-mail invalido';
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo de senha obrigatorio';
    }
    final regExp = RegExp(r'^(?=.*[A-Za-z])(?=.*\d).{6,}$');

    if (!regExp.hasMatch(value)) {
      return 'Senha deve ter  no minimo 6 caracteres letras , caracteres especiais e numero ou espaços ';
    }
    return null;
  }

  static String? confirmPassord(String? senha1, value) {
    if (value == null || value.isEmpty) {
      return 'Preencher campo ';
    }
    if (value != senha1) {
      return 'As senhas não conhecidem';
    }
    return null;
  }
}
