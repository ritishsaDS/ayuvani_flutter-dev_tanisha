import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ayuvani/data/repo/chemist_repo/chemist_login_repo.dart';
import 'package:flutter_ayuvani/models/chemist_models/chemist_login_model.dart';

part 'chemist_login_event.dart';
part 'chemist_login_state.dart';

class ChemistLoginBloc extends Bloc<ChemistLoginEvent, ChemistLoginState> {
  ChemistLoginBloc({this.chemistLoginRepo}) : super(ChemistLoginInitialState());
  final ChemistLoginRepo chemistLoginRepo;
  ChemistLoginFormChange chemistLogin;
  ChemistLoginModel chemistLoginModel;
  dynamic data;
  @override
  Stream<ChemistLoginState> mapEventToState(
    ChemistLoginEvent event,
  ) async* {
    if (event is ChemistLoginFormChangedEvent) {
      chemistLogin = ChemistLoginFormChange().copyWith(
        userName: event.email,
        password: event.password,
        rememberMe: event.rememberMeCheckBox,
      );
      yield chemistLogin;
    } else if (event is ChemistLoginPressed) {
      yield ChemistLoginLoadingState();
      try {
        data = await chemistLoginRepo.loginChemist(
            email: chemistLogin.userName, password: chemistLogin.password);

        if (data['code'] == 200) {
          chemistLoginModel = ChemistLoginModel.fromJson(data);
          yield ChemistLoginSucessfulState(
              chemistLoginModel: chemistLoginModel);
        } else {
          yield ChemistLoginErrorState(error: data['message'].toString());
        }
      } catch (error) {
        yield ChemistLoginErrorState(error: error.toString());
      }
    }
  }
}
