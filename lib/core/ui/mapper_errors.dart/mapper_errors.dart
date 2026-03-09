// lib/core/error/failure_extensions.dart
import 'package:flutter/material.dart';

import '../../error/failure.dart';
import '../../internacionalization/l10n/app_localizations.dart';

extension FailureMessage on Failure {
  String toMessage(BuildContext context) {
    AppLocalizations l10n = AppLocalizations.of(context)!;

    if (this is NetworkFailure) {
      return l10n.generic_error;
    }
    if (this is ServerFailure) {
      return l10n.generic_error;
    }

    // Si el error trae un mensaje del backend, lo mostramos, si no, el genérico
    return message.isNotEmpty ? message : l10n.generic_error;
  }
}
