import 'package:flutter/material.dart' hide Colors;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/internacionalization/l10n/app_localizations.dart';
import '../../../../design_system/components/error_illustration_home.dart';
import '../../../../design_system/illustrations/assets_icons.dart';

class RegionsView extends ConsumerWidget {
  const RegionsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AppLocalizations localizations = AppLocalizations.of(context)!;

    return ErrorIllustrationHome(
      title: localizations.error_title_coming_soon,
      subtitle: localizations.error_description_coming_soon,
      illustration: AssetsConstants.illustrationJigglypuffError,
    );
  }
}
