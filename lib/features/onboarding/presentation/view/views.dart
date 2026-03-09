library com.global66.onboarding.views;

import 'package:flutter/material.dart' hide Colors;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/internacionalization/l10n/app_localizations.dart';
import '../../../../core/internacionalization/locale_provider.dart';
import '../../../../design_system/components/poke_bola_loader.dart';
import '../../../../design_system/components/primary_button.dart';
import '../../../../design_system/illustrations/assets_icons.dart';
import '../../../../design_system/ui_constants/colors.dart';
import '../../../../design_system/ui_constants/layout.dart';
import '../../../../design_system/ui_constants/spacing.dart';
import '../state/onboarding_state.dart';
import '../viewmodel/onboarding_viewmodel.dart';
import '../viewmodel/splash_viewmodel.dart';
import '../widgets/widgets.dart';

part './loader_splash_screen.dart';
part './onboarding_view.dart';
