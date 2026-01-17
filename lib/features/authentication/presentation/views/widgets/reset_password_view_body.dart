import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/helper/show_snack_bar.dart';
import 'package:e_commerce_app/core/utilis/app_routes.dart';
import 'package:e_commerce_app/features/authentication/data/cubits/auth_cubit/auth_cubit.dart';
import 'package:e_commerce_app/features/authentication/presentation/views/widgets/custom_button.dart';
import 'package:e_commerce_app/features/authentication/presentation/views/widgets/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ResetPasswordViewBody extends StatelessWidget {
  ResetPasswordViewBody({super.key});
  String? oldPassword, newPassword;
  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ResetLoading) {
          isLoading = true;
        } else if (state is ResetSuccess) {
          GoRouter.of(context).pushReplacement(AppRouter.kLoginView);
          isLoading = false;
        } else if (state is ResetFailure) {
          showSnackBar(context, state.errMessage);
          isLoading = false;
        }
      },
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                    icon: Container(
                      width: 40,
                      height: 40,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: BoxBorder.all(color: Colors.grey),
                      ),
                      child: Icon(Icons.arrow_back_ios_new, size: 20),
                    ),
                  ),
                  SizedBox(height: 50),

                  CustomTextFormField(
                    obscureText: true,
                    onChanged: (value) {
                      oldPassword = value;
                    },
                    hintText: 'old password',
                    borderColor: Colors.black,
                    focusedColor: kPrimaryColor,
                  ),
                  SizedBox(height: 24),

                  CustomTextFormField(
                    obscureText: true,
                    onChanged: (value) {
                      newPassword = value;
                    },
                    hintText: 'new password',
                    borderColor: Colors.black,
                    focusedColor: kPrimaryColor,
                  ),
                  SizedBox(height: 70),

                  CustomButton(
                    text: 'Reset',
                    onTap: () {
                      FocusScope.of(context).unfocus();

                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<AuthCubit>(context).changePassword(
                          oldPassword: oldPassword!,
                          newPassword: newPassword!,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> changePassword() async {
    final user = FirebaseAuth.instance.currentUser!;
    final cred = EmailAuthProvider.credential(
      email: user.email!,
      password: oldPassword!,
    );
    await user.reauthenticateWithCredential(cred);
    await user.updatePassword(newPassword!);
  }
}
