import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/helper/navigation/app_navigation.dart';
import 'package:movie_app/common/widgets/loader.dart';
import 'package:movie_app/core/utils/show_snackbar.dart';
import 'package:movie_app/domain/auth/entities/auth_params.dart';
import 'package:movie_app/presentation/auth/bloc/auth_bloc.dart';
import 'package:movie_app/presentation/auth/pages/signin_page.dart';
import 'package:movie_app/presentation/auth/widgets/auth_button.dart';
import 'package:movie_app/presentation/auth/widgets/editing_field.dart';
import 'package:movie_app/presentation/home/pages/home_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            showSnackBar(context, '${state.message} !!!');
          } else if (state is AuthSuccess) {
            AppNavigation.pushAndRemoveUntil(context, const HomePage());
          }
        },
        builder: (context, state) {
          return SafeArea(
            minimum: const EdgeInsets.only(top: 100, right: 16, left: 16),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _signUpText(),
                  const SizedBox(height: 30),
                  EditingField(
                    controller: emailController,
                    title: 'Email',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 20),
                  EditingField(
                    controller: passwordController,
                    title: 'Password',
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  const SizedBox(height: 30),
                  AuthButton(
                    title: (state is AuthLoading)
                        ? const Loader()
                        : const Text('Sign Up'),
                    onPressed: (state is AuthLoading)
                        ? () {}
                        : () {
                            context.read<AuthBloc>().add(
                                  AuthSignUp(
                                    AuthParams(
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim(),
                                    ),
                                  ),
                                );
                            emailController.clear();
                            passwordController.clear();
                          },
                  ),
                  const SizedBox(height: 10),
                  _signInText(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _signUpText() {
    return const Text(
      'Sign Up',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
    );
  }

  Widget _signInText() {
    return Text.rich(
      TextSpan(
        text: 'Already have an account?',
        children: [
          TextSpan(
            text: ' Sign In',
            style: const TextStyle(color: Colors.blue),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigation.pushReplacement(context, const SigninPage());
              },
          ),
        ],
      ),
    );
  }
}
