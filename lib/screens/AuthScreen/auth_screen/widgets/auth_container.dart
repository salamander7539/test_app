part of '../auth_screen.dart';

class AuthContainer extends StatelessWidget {

  AuthContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<ChangeAuthCubit, ChangeAuthState>(
      builder: (context, state) {
        return BlocBuilder<LoginCubit, LoginState>(
          builder: (context, loginState) {
            return BlocBuilder<SignupCubit, SignupState>(
              builder: (context, regState) {
                return Padding(
                  padding: const EdgeInsets.only(top: 22, left: 20, right: 20),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Авторизация',
                          style: GoogleFonts.manrope(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const Divider(color: Colors.transparent, height: 16),
                      CustomTextField(
                        hint: 'Почта',
                        // controller: emailController,
                        onChanged: (value) {
                          context.read<ChangeAuthCubit>().emailChanged(value);
                        },
                      ),
                      const SizedBox(height: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextField(
                            hint: 'Пароль',
                            onChanged: (value) {
                              context.read<ChangeAuthCubit>().passwordChanged(value);
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const SizedBox(height: 20),
                          InkWell(
                            onTap: () {
                              if (state.status == ChangeStatus.login) {
                                context.read<LoginCubit>().login(email: state.email!, password: state.password!);
                              } else {
                                context.read<SignupCubit>().signUp(email: state.email!, password: state.password!);
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.blue.withOpacity(0.6),
                                    Colors.blue,
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(11),
                              ),
                              height: 52,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    (state.status == ChangeStatus.login) ? 'Войти' : 'Зарегистрироваться',
                                    style: GoogleFonts.manrope(
                                      fontSize: 17,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              TextButton(
                                onPressed: () {
                                  context.read<ChangeAuthCubit>().changeStatus();
                                },
                                child: Text(
                                  (state.status == ChangeStatus.login) ? 'Регистрация' : 'Войти',
                                  style: GoogleFonts.manrope(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Забыли пароль?',
                                  style: GoogleFonts.manrope(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
