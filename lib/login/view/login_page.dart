import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_yeti/login/login.dart';
import 'package:user_repository/user_repository.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: LoginPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.xlg,
          AppSpacing.xlg,
          AppSpacing.xlg,
          0,
        ),
        child: BlocProvider(
          create: (_) => LoginBloc(context.read<UserRepository>()),
          child: const LoginForm(),
        ),
      ),
    );
  }
}
