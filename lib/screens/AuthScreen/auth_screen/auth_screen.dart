import 'package:app_test/blocs/auth/auth_bloc.dart';
import 'package:app_test/cubits/change_auth/change_auth_cubit.dart';
import 'package:app_test/cubits/login/login_cubit.dart';
import 'package:app_test/cubits/signup/signup_cubit.dart';
import 'package:app_test/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets/custom_text_field.dart';

part 'widgets/auth_container.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Transform(
            transform: Matrix4.translationValues(20, -20, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Авторизация',
                  style: GoogleFonts.manrope(
                    fontSize: 23,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF2F2F2F),
                  ),
                ),
                const Divider(
                  color: Colors.transparent,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * .75,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  topLeft: Radius.circular(15),
                ),
              ),
              child: MultiBlocProvider(
                providers: [
                  BlocProvider<SignupCubit>(
                    create: (_) => SignupCubit(
                      authRepository: context.read<AuthRepository>(),
                    ),
                  ),
                  BlocProvider<LoginCubit>(
                    create: (_) => LoginCubit(
                      context.read<AuthRepository>(),
                    ),
                  ),
                  BlocProvider<ChangeAuthCubit>(
                    create: (_) => ChangeAuthCubit(),
                  ),
                ],
                child: AuthContainer(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
