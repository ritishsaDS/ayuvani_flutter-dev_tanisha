part of 'user_login_bloc.dart';

abstract class UserLoginState extends Equatable {
  UserLoginState();

  @override
  List<Object> get props => [];
}

class UserLoginInitial extends UserLoginState {
  @override
  List<Object> get props => [];
}

class UserLoginFormChangeState extends UserLoginState {
  final String userName, password;
  final bool rememberMe;

  UserLoginFormChangeState({
    this.password,
    this.userName,
    this.rememberMe = false,
  });

  UserLoginFormChangeState copyWith({
    final String userName,
    final String password,
    final bool rememberMe,
  }) {
    return UserLoginFormChangeState(
      userName: userName ?? this.userName,
      password: password ?? this.password,
      rememberMe: rememberMe ?? this.rememberMe,
    );
  }

  @override
  List<Object> get props => [password, userName, rememberMe];
}

class UserLoginLoadingState extends UserLoginState {}

class UserLoginSuccessState extends UserLoginState {
  final ChemistLoginModel chemistLoginModel;

  UserLoginSuccessState({this.chemistLoginModel});

  @override
  List<Object> get props => [chemistLoginModel];
}

class UserLoginErrorState extends UserLoginState {
  final String error;

  UserLoginErrorState({this.error});

  @override
  List<Object> get props => [error];
}
