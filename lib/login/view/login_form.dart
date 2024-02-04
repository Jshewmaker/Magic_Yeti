import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:magic_yeti/l10n/l10n.dart';
import 'package:magic_yeti/login/login.dart';
import 'package:magic_yeti/reset_password/reset_password.dart';
import 'package:magic_yeti/sign_up/sign_up.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text(l10n.authenticationFailure)),
            );
        }
      },
      child: ListView(
        children: const [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _LoginContent(),
              _LoginActions(),
            ],
          ),
        ],
      ),
    );
  }
}

class _LoginContent extends StatelessWidget {
  const _LoginContent();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Magic Yeti', style: theme.textTheme.titleLarge),
        const SizedBox(height: AppSpacing.xlg),
        Text(l10n.loginWelcomeText,
            style: theme.textTheme.displayLarge!
                .copyWith(color: AppColors.neutral60)),
        const SizedBox(height: AppSpacing.xxlg),
        _EmailInput(),
        const SizedBox(height: AppSpacing.xs),
        _PasswordInput(),
        const SizedBox(height: AppSpacing.xs),
        _ResetPasswordButton(),
      ],
    );
  }
}

class _LoginActions extends StatelessWidget {
  const _LoginActions();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _LoginButton(),
        const SizedBox(height: AppSpacing.xlg),
        _GoogleLoginButton(),
        if (theme.platform == TargetPlatform.iOS) ...[
          const SizedBox(height: AppSpacing.xlg),
          _AppleLoginButton(),
        ],
        const SizedBox(height: AppSpacing.xxlg),
        _SignUpButton(),
      ],
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final email = context.select((LoginBloc bloc) => bloc.state.email);
    return TextField(
      key: const Key('loginForm_emailInput_textField'),
      onChanged: (email) {
        context.read<LoginBloc>().add(LoginEmailChanged(email));
      },
      decoration: InputDecoration(
        helperText: '',
        labelText: l10n.emailInputLabelText,
        errorText:
            email.displayError != null ? l10n.invalidEmailInputErrorText : null,
      ),
      autofillHints: const [AutofillHints.email],
      keyboardType: TextInputType.emailAddress,
      keyboardAppearance: Theme.of(context).brightness,
      autocorrect: false,
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final password = context.select((LoginBloc bloc) => bloc.state.password);
    return TextField(
      key: const Key('loginForm_passwordInput_textField'),
      onChanged: (password) {
        context.read<LoginBloc>().add(LoginPasswordChanged(password));
      },
      obscureText: true,
      autofillHints: const [AutofillHints.password],
      keyboardType: TextInputType.visiblePassword,
      keyboardAppearance: Theme.of(context).brightness,
      decoration: InputDecoration(
        helperText: '',
        labelText: l10n.passwordInputLabelText,
        errorText: password.displayError != null
            ? l10n.invalidPasswordInputErrorText
            : null,
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final state = context.watch<LoginBloc>().state;
    return ElevatedButton(
      key: const Key('loginForm_continue_elevatedButton'),
      onPressed: state.valid
          ? () =>
              context.read<LoginBloc>().add(const LoginCredentialsSubmitted())
          : null,
      child: state.status.isInProgress
          ? const CircularProgressIndicator()
          : Text(
              l10n.loginButtonText,
              style: const TextStyle(color: Colors.white),
            ),
    );
  }
}

class _AppleLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return ElevatedButton.icon(
      key: const Key('loginForm_appleLogin_elevatedButton'),
      label: Text(
        l10n.signInWithAppleButtonText,
        style: const TextStyle(color: Colors.black),
      ),
      icon: const Icon(Icons.apple, color: AppColors.black),
      onPressed: () =>
          context.read<LoginBloc>().add(const LoginAppleSubmitted()),
    );
  }
}

class _GoogleLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return ElevatedButton(
      key: const Key('loginForm_googleLogin_elevatedButton'),
      onPressed: () =>
          context.read<LoginBloc>().add(const LoginGoogleSubmitted()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.add, color: AppColors.black),
          const SizedBox(width: AppSpacing.xlg),
          Text(
            l10n.signInWithGoogleButtonText,
            style: const TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return TextButton(
      key: const Key('loginForm_createAccount_textButton'),
      onPressed: () => Navigator.of(context).push<void>(SignUpPage.route()),
      child: Text(l10n.createAccountButtonText),
    );
  }
}

class _ResetPasswordButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return TextButton(
      key: const Key('loginForm_forgotPassword_textButton'),
      onPressed: () => Navigator.of(context).push<void>(
        ResetPasswordPage.route(),
      ),
      child: Text(l10n.forgotPasswordText),
    );
  }
}
