import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bus_app/data/models/user_model/user_model.dart';
import 'package:bus_app/data/repos/user_repo/user_repo.dart';
import 'package:meta/meta.dart';

part 'authration_state.dart';

class AuthrationCubit extends Cubit<AuthrationState> {
  AuthrationCubit(this.userRepo) : super(AuthrationInitial());
  final UserRepo userRepo;
  authorizationLogin({required String name, required String password}) async {
    emit(AuthorizationLooding());
    var result = await userRepo.fetchLogin(name: name, password: password);
    result.fold((l) {
      emit(AuthorizationFailure(l.errorMassage));
    }, (r) {
      emit(AuthorizationSuccess(userData: r));
    });
  }

  authorizationRegister(
      {required String name,
      required String password,
      required String phone,
      required String emial}) async {
    emit(AuthorizationLooding());
    var result = await userRepo.fetchRegister(
        email: emial, password: password, name: name, phone: phone);
    result.fold((l) {
      emit(AuthorizationFailure(l.errorMassage));
    }, (r) {
      emit(AuthorizationSuccess(userData: r));
    });
  }

  @override
  void onChange(Change<AuthrationState> change) {
    log(change.toString());
  }
}
