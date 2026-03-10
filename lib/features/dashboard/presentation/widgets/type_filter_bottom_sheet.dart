part of com.global66.home.widgets;

/// Muestra el BottomSheet de filtro por tipo de Pokémon.
/// Retorna un [Set<String>] con los tipos seleccionados o null si se cancela.
Future<Set<String>?> showTypeFilterBottomSheet(
  BuildContext context, {
  Set<String> initialSelected = const <String>{},
}) => showModalBottomSheet<Set<String>>(
  context: context,
  isScrollControlled: true,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(top: Radius.circular(UILayout.medium)),
  ),
  builder: (_) => _TypeFilterBottomSheet(initialSelected: initialSelected),
);

class _TypeFilterBottomSheet extends StatefulWidget {
  const _TypeFilterBottomSheet({required this.initialSelected});

  final Set<String> initialSelected;

  @override
  State<_TypeFilterBottomSheet> createState() => _TypeFilterBottomSheetState();
}

class _TypeFilterBottomSheetState extends State<_TypeFilterBottomSheet> {
  late Set<String> _selected;
  bool _isExpanded = true;

  @override
  void initState() {
    super.initState();
    _selected = Set<String>.from(widget.initialSelected);
  }

  void _toggle(String type) {
    setState(() {
      if (_selected.contains(type)) {
        _selected.remove(type);
      } else {
        _selected.add(type);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;

    return DraggableScrollableSheet(
      initialChildSize: 0.75,
      minChildSize: 0.5,
      maxChildSize: 0.9,
      expand: false,
      builder: (BuildContext context, ScrollController scrollController) =>
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: UILayout.medium),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Spacing.spacingV8,

                // Drag indicator
                Center(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: BorderColors.defaultColor.color,
                      borderRadius: BorderRadius.circular(UILayout.small),
                    ),
                    child: const SizedBox(width: 40, height: 4),
                  ),
                ),
                Spacing.spacingV16,

                // Header: Close button
                Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.close,
                        size: UILayout.large,
                        color: TextColors.textPrimary.color,
                      ),
                    ),
                  ],
                ),
                Spacing.spacingV8,

                // Title
                Text(
                  localizations.filter_title,
                  style: TextStyle(
                    fontSize: UILayout.largeText,
                    fontWeight: FontWeight.bold,
                    color: TextColors.textPrimary.color,
                  ),
                ),
                Spacing.spacingV24,

                // Expandable "Tipo" header
                GestureDetector(
                  onTap: () => setState(() => _isExpanded = !_isExpanded),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        localizations.filter_type,
                        style: TextStyle(
                          fontSize: UILayout.medium,
                          fontWeight: FontWeight.w600,
                          color: TextColors.textPrimary.color,
                        ),
                      ),
                      Icon(
                        _isExpanded
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: TextColors.textSecondary.color,
                      ),
                    ],
                  ),
                ),
                Spacing.spacingV8,
                const Divider(height: 1, thickness: 1),

                // List of types
                if (_isExpanded)
                  Expanded(
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: PokemonType.values.length,
                      itemBuilder: (BuildContext context, int index) {
                        PokemonType pokemonType = PokemonType.values[index];
                        bool isSelected = _selected.contains(
                          pokemonType.apiKey,
                        );

                        return InkWell(
                          onTap: () => _toggle(pokemonType.apiKey),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: UILayout.smallText,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  PokemonTypeHelper.getConfig(
                                    pokemonType,
                                  ).label,
                                  style: TextStyle(
                                    fontSize: UILayout.medium,
                                    color: TextColors.textPrimary.color,
                                  ),
                                ),
                                DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? const Color(0xFF1565C0)
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                      color: isSelected
                                          ? const Color(0xFF1565C0)
                                          : BorderColors.defaultColor.color,
                                    ),
                                  ),
                                  child: SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: isSelected
                                        ? const Icon(
                                            Icons.check,
                                            size: 14,
                                            color: Color(0xFFFFFFFF),
                                          )
                                        : null,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                else
                  const Spacer(),

                // Buttons
                Spacing.spacingV16,
                PrimaryButton(
                  label: localizations.filter_apply,
                  onPressed: () => Navigator.pop(context, _selected),
                ),
                Spacing.spacingV8,
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(localizations.filter_cancel),
                  ),
                ),
                Spacing.spacingV24,
              ],
            ),
          ),
    );
  }
}
