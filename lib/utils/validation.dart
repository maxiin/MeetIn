String emailRegex = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

// for a positive validation, just return null.
String validateEmail(String email) {
  if(email.isEmpty){
    return 'Este campo é obrigatório';
  }else if(!RegExp(emailRegex).hasMatch(email)){
    return 'Email inválido';
  }
  return null;
}

String lengthValidator(String text, int min, int max) {
  if(min != null && text.length < min) {
    return 'Este campo tem o minimo de $min caracteres';
  }else if (max != null && text.length > max) {
    return 'Este campo tem o máximo de $max caracteres';
  }
  return null;
}