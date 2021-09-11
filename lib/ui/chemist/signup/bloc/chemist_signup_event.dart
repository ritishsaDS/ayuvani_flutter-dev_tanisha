part of 'chemist_signup_bloc.dart';

abstract class ChemistSignupEvent extends Equatable {
  const ChemistSignupEvent();

  @override
  List<Object> get props => [];
}

class SignUpSubmittedForm extends ChemistSignupEvent {
  final String name,
      userName,
      phone,
      email,
      gender,
      dob,
      height,
      weight,
      loginType,
      passwords;
  final bool rememberMe;
  List<int> disability;
  SignUpSubmittedForm(
      {this.name,
      this.userName,
      this.phone,
      this.email,
      this.gender,
      this.dob,
      this.height,
      this.weight,
      this.disability,
      this.rememberMe,
      this.loginType,
      this.passwords});

  @override
  List<Object> get props => [
        name,
        userName,
        phone,
        email,
        gender,
        dob,
        height,
        weight,
        disability,
        loginType,
        passwords
      ];
}
