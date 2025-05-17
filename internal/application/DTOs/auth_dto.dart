import 'package:ratel/annotations/geral_annotations.dart';

import '../../shared/utils.dart';

@Json()
class AuthDTO {
  late String? userName;

  late String? password;

  late String? confirmPassword;

  AuthDTO({this.userName, this.password, this.confirmPassword});

  bool checkEmptyFields({bool checkConfirmPassword = false}) {
    return isNullOrEmpty(userName) &&
            isNullOrEmpty(password) &&
            checkConfirmPassword == true
        ? isNullOrEmpty(confirmPassword)
        : false;
  }

  bool checkIfPasswordEqualsConfirmPassword() {
    return password == confirmPassword;
  }
}
