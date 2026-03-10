library com.global66.home.pages;

import 'package:flutter/material.dart' hide Colors;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/internacionalization/l10n/app_localizations.dart';
import '../../../../design_system/components/error_illustration_home.dart';
import '../../../../design_system/components/poke_bola_loader.dart';
import '../../../../design_system/illustrations/assets_icons.dart';
import '../../../../design_system/ui_constants/colors.dart';
import '../../../../design_system/ui_constants/layout.dart';
import '../../../../design_system/ui_constants/spacing.dart';
import '../../di/dashboards_providers.dart';
import '../../domain/entities/pokedex_detail.dart';
import '../../domain/entities/pokemon.dart';
import '../../domain/entities/pokemon_small_detail.dart';
import '../state/dashboard_state.dart';
import '../viewmodel/dashboard_viewmodel.dart';
import '../viewmodel/pokemon_filter_providers.dart';
import '../widgets/widgets.dart';

part './home.dart';
part './pokedex_detail.dart';
