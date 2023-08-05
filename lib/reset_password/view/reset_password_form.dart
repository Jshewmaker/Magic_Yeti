import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:magic_yeti/l10n/l10n.dart';
import 'package:magic_yeti/reset_password/reset_password.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocListener<ResetPasswordBloc, ResetPasswordState>(
      listener: (context, state) {
        if (state.status.isSuccess || state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text(l10n.resetPasswordSubmitText)),
            );
          Navigator.of(context).pop();
        }
      },
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _EmailInput(),
          SizedBox(height: AppSpacing.xs),
          _SubmitButton(),
        ],
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final email = context.select((ResetPasswordBloc bloc) => bloc.state.email);
    return TextField(
      key: const Key('resetPasswordForm_emailInput_textField'),
      onChanged: (email) {
        context.read<ResetPasswordBloc>().add(ResetPasswordEmailChanged(email));
      },
      decoration: InputDecoration(
        helperText: '',
        labelText: l10n.emailInputLabelText,
        errorText:
            email.displayError != null ? l10n.invalidEmailInputErrorText : null,
      ),
      autocorrect: false,
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final state = context.watch<ResetPasswordBloc>().state;
    return ElevatedButton(
      key: const Key('submitResetPassword_continue_elevatedButton'),
      onPressed: state.valid
          ? () => context
              .read<ResetPasswordBloc>()
              .add(const ResetPasswordSubmitted())
          : null,
      child: state.status.isInProgress
          ? const CircularProgressIndicator()
          : Text(l10n.submitButtonText),
    );
  }
}
