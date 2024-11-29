import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pembelajaran_ke_5/service/auth_service.dart';
import 'package:pembelajaran_ke_5/users_models.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void signUp({
    required String name,
    required String email,
    required String password,
  }) async{
    try {
      emit(AuthLoading());
      UsersModels user = await AuthService().signUp(name: name, email: email, password: password);
      emit(AuthSucces(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

   void signIn({
    required String email,
    required String password,
  }) async{
    try {
      emit(AuthLoading());
      UsersModels user = await AuthService().signIn(email: email, password: password);
      emit(AuthSucces(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }
}
