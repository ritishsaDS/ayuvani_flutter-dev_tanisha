import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_ayuvani/data/repo/chemist_repo/chemist_register_repo.dart';
import 'package:flutter_ayuvani/models/chemist_models/chemist_register_model.dart';

part 'chemist_signup_event.dart';
part 'chemist_signup_state.dart';

class ChemistSignupBloc extends Bloc<ChemistSignupEvent, ChemistSignupState> {
  ChemistSignupBloc({this.chemistResgisterRepo})
      : super(ChemistSignupInitial());

  final ChemistResgisterRepo chemistResgisterRepo;

  @override
  Stream<ChemistSignupState> mapEventToState(
    ChemistSignupEvent event,
  ) async* {
    if (event is SignUpSubmittedForm) {
      try {
        yield SignUpLoadingState();
        var data = await chemistResgisterRepo.registeruser(
          phone: event.phone,
          height: event.height,
          gender: event.gender,
          password: event.passwords,
          loginType: event.loginType,
          dob: event.dob,
          name: event.name,
          userName: event.userName,
          email: event.email,
          disability: event.disability,
          weight: event.weight,
        );

        yield SignUpSuccessfulState(chemistRegisterModel: data);
      } catch (error) {
        yield ChemistSignUpErrorState(error: error);
      }
    }
  }
}
