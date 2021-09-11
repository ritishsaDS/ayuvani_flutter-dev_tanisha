part of 'chemist_signup_bloc.dart';

abstract class ChemistSignupState extends Equatable {
  const ChemistSignupState();
  List<Object> get props => [];
}

class ChemistSignupInitial extends ChemistSignupState {
  @override
  List<Object> get props => [];
}

class SignupPostingState extends ChemistSignupState {
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
  final List<int> disablities;

  SignupPostingState(
      {this.name = '',
      this.userName = '',
      this.phone = '',
      this.email = '',
      this.gender = '',
      this.dob = '',
      this.height = '',
      this.weight = '',
      this.disablities,
      this.loginType = '',
      this.passwords = ''});

  SignupPostingState copyWith({
    final String name,
    userName,
    phone,
    email,
    gender,
    dob,
    height,
    weight,
    loginType,
    passwords,
    final bool rememberMe,
    final List<int> disablities,
  }) {
    return SignupPostingState(
      name: name ?? this.name,
      userName: userName ?? this.userName,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      dob: dob ?? this.dob,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      loginType: loginType ?? this.loginType,
      passwords: passwords ?? this.passwords,
      disablities: disablities ?? this.disablities,
    );
  }

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
        disablities,
        loginType,
        passwords
      ];
}

class SignUpLoadingState extends ChemistSignupState {}

class SignUpSuccessfulState extends ChemistSignupState {
  final ChemistRegisterModel chemistRegisterModel;

  SignUpSuccessfulState({this.chemistRegisterModel});

  @override
  List<Object> get props => [chemistRegisterModel];
}

class ChemistSignUpErrorState extends ChemistSignupState {
  final String error;

  ChemistSignUpErrorState({this.error});

  @override
  List<Object> get props => [error];
}
