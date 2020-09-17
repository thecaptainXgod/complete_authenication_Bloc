import 'dart:async';

import 'package:complete_authentication_tut/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class RegisterBloc with Validators {
  final _name = BehaviorSubject<String>();
  final _emailId = BehaviorSubject<String>();
  final _phoneNumber = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _confirmPassword = BehaviorSubject<String>();

//Getters
  Stream<String> get name => _name.stream.transform(nameValidator);
  Stream<String> get emailId => _emailId.stream.transform(emailValidator);
  Stream<String> get phoneNumber =>
      _phoneNumber.stream.transform(phoneValidator);
  Stream<String> get password => _password.stream.transform(passwordValidator);
  Stream<String> get confirmPassword =>
      _confirmPassword.stream.transform(confirmPasswordValidator);

  Stream<bool> get isValid => Rx.combineLatest5(name, emailId, phoneNumber,
      password, confirmPassword, (name, email, phone, pass, confPass) => true);

  ///`To match the password`
  Stream<bool> get passwordMatch =>
      Rx.combineLatest2(password, confirmPassword, (pass, confPass) {
        if (pass != confPass) {
          return false;
        } else {
          return true;
        }
      });

//Setters
  Function(String) get changeName => _name.sink.add;
  Function(String) get changeEmailId => _emailId.sink.add;
  Function(String) get changePhoneNumber => _phoneNumber.sink.add;
  Function(String) get changePassword => _password.sink.add;
  Function(String) get changeConfirmPassword => _confirmPassword.sink.add;

//Submit
  void submit() {
    if (password != confirmPassword) {
      _confirmPassword.sink.addError("Password doesn't match");
    } else {
      //TODO: CALL API
      print(_name);
      print(_emailId);
      print(_phoneNumber);
      print(_password);
      print(_confirmPassword);
    }
  }

//dispose
  void dispose() {
    _name.close();
    _emailId.close();
    _phoneNumber.close();
    _password.close();
    _confirmPassword.close();
  }
}
