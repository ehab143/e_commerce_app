import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/helper/show_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> registerUser({
    required String email,
    required String password,
  }) async {
    emit(RegisterLoading());
    try {
      var auth = FirebaseAuth.instance;
      UserCredential user = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterFailure(errMessage: 'password is too weak!'));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterFailure(errMessage: 'email already exist'));
      }
    } catch (e) {
      emit(RegisterFailure(errMessage: 'an error occur $e'));
    }
  }

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    try {
      var auth = FirebaseAuth.instance;
      UserCredential user = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailure(errMessage: 'user-not-found'));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailure(errMessage: 'wrong-password'));
      }
    } catch (e) {
      emit(LoginFailure(errMessage: 'an error occur $e'));
    }
  }

  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    emit(ResetLoading());
    try {
      final user = FirebaseAuth.instance.currentUser!;
      final cred = EmailAuthProvider.credential(
        email: user.email!,
        password: oldPassword,
      );
      await user.reauthenticateWithCredential(cred);
      await user.updatePassword(newPassword);
      emit(ResetSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-logged-in') {
        emit(ResetFailure(errMessage: 'User is not logged in'));
      } else if (e.code == 'wrong-password') {
        emit(ResetFailure(errMessage: ' old password is incorrect'));
      }
    } catch (e) {
      emit(ResetFailure(errMessage: 'an error occur $e'));
    }
  }
}
