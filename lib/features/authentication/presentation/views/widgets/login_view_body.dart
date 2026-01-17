import 'package:e_commerce_app/core/helper/show_snack_bar.dart';
import 'package:e_commerce_app/features/authentication/data/cubits/auth_cubit/auth_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/utilis/app_routes.dart';
import 'package:e_commerce_app/core/utilis/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'custom_button.dart';
import 'custom_text_form_field.dart';

class LoginViewBody extends StatelessWidget {
  LoginViewBody({super.key});
  String? email, password;
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSuccess) {
          GoRouter.of(context).push(AppRouter.kProductsView);
          isLoading = false;
        } else if (state is LoginFailure) {
          showSnackBar(context, state.errMessage);
          isLoading = false;
        }
      },
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: IconButton(
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
                ),
                SizedBox(height: 16),
                Center(
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 250,
                    height: 250,
                  ),
                ),
                SizedBox(height: 50),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.53,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          SizedBox(height: 24),
                          Text(
                            textAlign: TextAlign.center,

                            'Welcome Back!',
                            style: Styles.textStyle18,
                          ),
                          SizedBox(height: 8),
                          Text(
                            textAlign: TextAlign.center,

                            'Enter your details below',
                            style: TextStyle(color: Colors.white70),
                          ),
                          SizedBox(height: 16),

                          CustomTextFormField(
                            textStyle: TextStyle(color: Colors.white),
                            textInputType: TextInputType.emailAddress,
                            onChanged: (value) {
                              email = value;
                            },
                            hintText: 'Email',
                            hintStyle: Styles.textStyle18,
                            borderColor: Colors.white,
                            focusedColor: kPrimaryColor,
                          ),
                          SizedBox(height: 16),

                          CustomTextFormField(
                            textStyle: TextStyle(color: Colors.white),

                            hintText: 'Password',
                            obscureText: true,
                            onChanged: (value) {
                              password = value;
                            },
                            hintStyle: Styles.textStyle18,
                            borderColor: Colors.white,
                            focusedColor: kPrimaryColor,
                          ),
                          SizedBox(height: 12),

                          GestureDetector(
                            onTap: () {
                              GoRouter.of(
                                context,
                              ).push(AppRouter.kResetPassword);
                            },
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: kPrimaryColor,
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 60),
                          CustomButton(
                            text: 'Log In',
                            onTap: () {
                              FocusScope.of(context).unfocus();

                              if (formKey.currentState!.validate()) {
                                BlocProvider.of<AuthCubit>(
                                  context,
                                ).loginUser(email: email!, password: password!);
                              }
                            },
                          ),
                          SizedBox(height: 10),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Don\'t have an acount ? ',
                                style: TextStyle(color: Colors.white),
                              ),
                              GestureDetector(
                                onTap: () {
                                  GoRouter.of(
                                    context,
                                  ).pushReplacement(AppRouter.kRegisterView);
                                },
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(color: kPrimaryColor),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loginrUser() async {
    var auth = FirebaseAuth.instance;
    UserCredential user = await auth.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
