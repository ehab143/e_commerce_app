import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/helper/show_snack_bar.dart';
import 'package:e_commerce_app/core/utilis/app_routes.dart' show AppRouter;
import 'package:e_commerce_app/core/utilis/styles.dart';
import 'package:e_commerce_app/features/authentication/data/cubits/auth_cubit/auth_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'custom_button.dart';
import 'custom_text_form_field.dart';

class RegisterViewBody extends StatelessWidget {
  RegisterViewBody({super.key});
  String? email, password, confirmPassword;
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          isLoading = true;
        } else if (state is RegisterSuccess) {
          GoRouter.of(context).push(AppRouter.kProductsView);
          isLoading = false;
        } else if (state is RegisterFailure) {
          showSnackBar(context, state.errMessage);
          isLoading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
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
                    height: MediaQuery.of(context).size.height * 0.60,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            SizedBox(height: 24),
                            Text(
                              textAlign: TextAlign.center,

                              'Get Started',
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
                              onChanged: (value) {
                                email = value;
                              },
                              textStyle: TextStyle(color: Colors.white),
                              textInputType: TextInputType.emailAddress,
                              hintText: 'Email',
                              hintStyle: Styles.textStyle18,
                              borderColor: Colors.white,
                              focusedColor: kPrimaryColor,
                            ),
                            SizedBox(height: 16),

                            CustomTextFormField(
                              onChanged: (value) {
                                password = value;
                              },
                              textStyle: TextStyle(color: Colors.white),
                              hintText: 'Password',
                              obscureText: true,
                              hintStyle: Styles.textStyle18,
                              borderColor: Colors.white,
                              focusedColor: kPrimaryColor,
                            ),
                            SizedBox(height: 16),

                            CustomTextFormField(
                              onChanged: (value) {
                                confirmPassword = value;
                              },
                              textStyle: TextStyle(color: Colors.white),

                              hintText: 'Confirm Password',
                              obscureText: true,

                              hintStyle: Styles.textStyle18,

                              borderColor: Colors.white,
                              focusedColor: kPrimaryColor,
                            ),
                            SizedBox(height: 50),
                            CustomButton(
                              text: 'Sign Up',
                              onTap: () {
                                FocusScope.of(context).unfocus();

                                if (formKey.currentState!.validate()) {
                                  if (password == confirmPassword) {
                                    BlocProvider.of<AuthCubit>(
                                      context,
                                    ).registerUser(
                                      email: email!,
                                      password: password!,
                                    );
                                  } else {
                                    showSnackBar(
                                      context,
                                      'password doesn\'t match',
                                    );
                                  }
                                }
                              },
                            ),
                            SizedBox(height: 10),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Already have an account ? ',
                                  style: TextStyle(color: Colors.white),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    GoRouter.of(
                                      context,
                                    ).pushReplacement(AppRouter.kLoginView);
                                  },
                                  child: Text(
                                    'Log In',
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
        );
      },
    );
  }

  Future<void> registerUser() async {
    var auth = FirebaseAuth.instance;
    UserCredential user = await auth.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
