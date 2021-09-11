import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ayuvani/models/chemist_models/chemist_login_model.dart';

import '.././../../../data/repo/user_repo/user_login.dart';

part 'user_login_event.dart';
part 'user_login_state.dart';

class UserLoginBloc extends Bloc<UserLoginEvent, UserLoginState> {
  UserLoginBloc({this.userLoginApi}) : super(UserLoginInitial());
  final UserLoginApi userLoginApi;
  UserLoginFormChangeState userLoginFormChangeState;
  ChemistLoginModel chemistLoginModel;

  @override
  Stream<UserLoginState> mapEventToState(
    UserLoginEvent event,
  ) async* {
    if (event is UserLoginFormChangedEvent) {
      userLoginFormChangeState = UserLoginFormChangeState(
          userName: event.name, password: event.password);
      yield userLoginFormChangeState;
    } else if (event is LoginSuccessEvent) {
      yield UserLoginLoadingState();
      try {
        final data = await userLoginApi.userlogin(
            email: userLoginFormChangeState.userName,
            password: userLoginFormChangeState.password);
        if (data['code'] == 200) {
          chemistLoginModel = ChemistLoginModel.fromJson(data);

          yield UserLoginSuccessState(chemistLoginModel: chemistLoginModel);
        } else {
          yield UserLoginErrorState(error: data['message']);
        }
      } catch (error) {
        yield UserLoginErrorState(error: error.toString());
      }
    }
  }
}
