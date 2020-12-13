import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'validators.dart';

class Bloc extends Object with Validators {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Function(String) get changeEmail => _emailController.add;
  Function(String) get changePassword => _passwordController.add;

  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password =>
      _passwordController.stream.transform(validatePassword);
  Stream<bool> get isValid =>
      Rx.combineLatest2(email, password, (e, p) => true);

  void submit() {
    final validEmail = _emailController.value;
    final validPassword = _passwordController.value;

    print(
        'you email is ${validEmail.trim()}, and your password is ${validPassword.trim()}');
  }

  disposed() {
    _emailController.close();
    _passwordController.close();
  }
}
