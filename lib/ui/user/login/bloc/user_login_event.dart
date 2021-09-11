part of 'user_login_bloc.dart';

abstract class UserLoginEvent extends Equatable {
  UserLoginEvent();
  @override
  List<Object> get props => [];
}

class UserLoginFormChangedEvent extends UserLoginEvent {
  final String name, password;
  final bool rememberMe;

  UserLoginFormChangedEvent({this.name, this.password, this.rememberMe});

  @override
  List<Object> get props => [name, password, rememberMe];
}

class LoginSuccessEvent extends UserLoginEvent {}
