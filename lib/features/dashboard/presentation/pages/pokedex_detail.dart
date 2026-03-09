import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/internacionalization/l10n/app_localizations.dart';
import '../../../../design_system/components/poke_bola_loader.dart';
import '../../di/dashboards_providers.dart';
import '../../domain/entities/pokedex_detail.dart';
import '../widgets/widgets.dart';

class PokedexDetailView extends ConsumerWidget {
  const PokedexDetailView({required this.id, super.key});
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<PokedexDetail> detail = ref.watch(pokedexDetailProvider(id));
    AppLocalizations localizations = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Colors.white,
      body: detail.when(
        loading: () => const Center(child: PokeBolaLoader()),
        error: (_, __) =>
            Center(child: ErrorLoadingHome(localizations: localizations)),
        data: (PokedexDetail pokemon) => PokedexDetailContent(pokemon: pokemon),
      ),
    );
  }
}
