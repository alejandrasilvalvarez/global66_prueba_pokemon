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
      body: detail.when(
        loading: () => const Center(child: PokeBolaLoader()),
        error: (_, __) =>
            Center(child: ErrorLoadingHome(localizations: localizations)),
        data: (PokedexDetail pokemon) => PokedexDetailContent(pokemon: pokemon),
      ),
    );
  }
}

class PokedexDetailContent extends StatelessWidget {
  const PokedexDetailContent({required this.pokemon, super.key});
  final PokedexDetail pokemon;

  @override
  Widget build(BuildContext context) => SafeArea(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          PokemonHeader(pokemon: pokemon),
          const SizedBox(height: 16),

          /// IMAGE
          Center(
            child: Image.network(
              pokemon.imageUrl,
              height: 160,
              fit: BoxFit.contain,
            ),
          ),

          const SizedBox(height: 16),

          /// TYPES
          Wrap(
            spacing: 8,
            children: pokemon.types
                .map((String type) => Chip(label: Text(type)))
                .toList(),
          ),

          const SizedBox(height: 16),

          /// DESCRIPTION
          Text(pokemon.description, style: const TextStyle(fontSize: 14)),

          const SizedBox(height: 24),

          /// STATS
          Row(
            children: <Widget>[
              PokemonStatCard(label: 'Peso', value: '${pokemon.weight} kg'),
              const SizedBox(width: 8),
              PokemonStatCard(label: 'Altura', value: '${pokemon.height} m'),
            ],
          ),

          const SizedBox(height: 8),

          Row(
            children: <Widget>[
              PokemonStatCard(label: 'Categoría', value: pokemon.category),
              const SizedBox(width: 8),
              PokemonStatCard(label: 'Habilidad', value: pokemon.ability),
            ],
          ),

          const SizedBox(height: 24),

          /// WEAKNESSES
          const Text(
            'Debilidades',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 8),

          Wrap(
            spacing: 8,
            children: pokemon.weaknesses
                .map((String type) => Chip(label: Text(type)))
                .toList(),
          ),
        ],
      ),
    ),
  );
}

class PokemonHeader extends StatelessWidget {
  const PokemonHeader({required this.pokemon, super.key});
  final PokedexDetail pokemon;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        pokemon.name,
        style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
      ),
      Text('N°${pokemon.id.toString().padLeft(3, '0')}'),
    ],
  );
}

class PokemonStatCard extends StatelessWidget {
  const PokemonStatCard({required this.label, required this.value, super.key});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) => Expanded(
    child: Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        children: <Widget>[
          Text(label),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    ),
  );
}
