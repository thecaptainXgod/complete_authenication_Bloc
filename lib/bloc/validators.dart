import 'dart:async';

///The `StreamTransformers` for validations
mixin Validators {
  var emailValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      if (email.isEmpty) {
        return sink.addError("This field can't be empty");
      }
      if (email.length > 32) {
        return sink.addError("Email can't be more than 32 characters");
      }
      if (!email.startsWith(RegExp(r'[A-za-z]'))) {
        return sink.addError("Email cannot start with special characters");
      }
      if (email.length < 6) {
        return sink.addError("Email is too short");
      }
      if (!RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email)) {
        return sink.addError("Invalid Email");
      } else {
        sink.add(email);
      }
    },
  );

  var loginPasswordValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      if (password.isEmpty) {
        return sink.addError("This field can't be empty");
      }

      if (password.length < 8) {
        return sink.addError("Password can't be less than 8 characters");
      } else {
        sink.add(password);
      }
    },
  );

  var nameValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (name, sink) {
      if (name.isEmpty) {
        return sink.addError("This field can't be empty");
      }

      if (name.length > 32) {
        return sink.addError("Name can't be more than 32 characters");
      }
      if (name.length < 3) {
        return sink.addError("Name is too short");
      }
      if (name.contains(RegExp(r'[0-9]'))) {
        return sink.addError("Name field can't contain numbers");
      }
      if (!RegExp(r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$")
          .hasMatch(name)) {
        return sink.addError("Invalid Name");
      } else {
        sink.add(name);
      }
    },
  );

  var phoneValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (phone, sink) {
      if (phone.isEmpty) {
        return sink.addError("This field can't be empty");
      }
      if (phone.length > 10) {
        return sink.addError("Phone number can't be more than 10 digits");
      }
      if (phone.length < 10) {
        return sink.addError("Phone number can't be less than 10 digits");
      }
      if (phone.contains(RegExp(r'[A-Z]')) ||
          phone.contains(RegExp(r'[a-z]'))) {
        return sink.addError("Phone number can only contain numbers");
      }
      if (!RegExp(r"[0-9]{10}").hasMatch(phone)) {
        return sink.addError("Not a valid phone number");
      }
      if (!phone.startsWith(RegExp(r"[0-9]"))) {
        return sink.addError("Not a valid phone number");
      } else {
        sink.add(phone);
      }
    },
  );

  var passwordValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
      if (password.isEmpty) {
        return sink.addError("This field can't be empty");
      }
      if (password.length < 8) {
        return sink.addError("Password can't be less than 8 characters");
      }
      if (password.length < 8) {
        return sink.addError("Password can't be less than 8 characters");
      }
      if (!RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^\da-zA-Z]).{8,15}$")
          .hasMatch(password)) {
        return sink.addError(
            "Password must contain one small,Captial and a special character");
      } else {
        sink.add(password);
      }
    },
  );

  var confirmPasswordValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (confPass, sink) {
      if (confPass.isEmpty) {
        return sink.addError("This field can't be empty");
      } else {
        sink.add(confPass);
      }
    },
  );
}
