library com.global66.home.widgets;

import 'package:flutter/material.dart' hide Colors;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/internacionalization/l10n/app_localizations.dart';
import '../../../../core/ui/pokemon_type_helper.dart';
import '../../../../design_system/components/error_illustration_home.dart';
import '../../../../design_system/components/favourite_button.dart';
import '../../../../design_system/components/pokemon_card_shimmer.dart';
import '../../../../design_system/components/pokemon_type_flag.dart';
import '../../../../design_system/components/primary_button.dart';
import '../../../../design_system/illustrations/assets_icons.dart';
import '../../../../design_system/ui_constants/border_radius.dart';
import '../../../../design_system/ui_constants/colors.dart';
import '../../../../design_system/ui_constants/layout.dart';
import '../../../../design_system/ui_constants/spacing.dart';
import '../../di/dashboards_providers.dart';
import '../../domain/entities/pokedex_detail.dart';
import '../../domain/entities/pokemon_small_detail.dart';
import '../viewmodel/favourites_viewmodel.dart';

part 'error_loading_home.dart';
part 'pokemon_card.dart';
part 'pokedex_detail.dart';
