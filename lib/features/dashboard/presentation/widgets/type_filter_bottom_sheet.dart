part of com.global66.home.widgets;

// TODO: implement Bottomsheet
Future<Set<String>?> showTypeFilterBottomSheet(
  BuildContext context, {
  Set<String> initialSelected = const <String>{},
}) => showModalBottomSheet<Set<String>>(
  context: context,
  useRootNavigator: true,
  isScrollControlled: true,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(top: Radius.circular(UILayout.medium)),
  ),
  builder: (_) => FractionallySizedBox(
    heightFactor: 0.75,
    child: _TypeFilterBottomSheet(initialSelected: initialSelected),
  ),
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

    ScrollController? scrollController;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: UILayout.medium),
      child: Column(
        children: <Widget>[
          Spacing.spacingV12,

          Row(
            children: <Widget>[
              IconButton(
                padding: EdgeInsets.zero,
                iconSize: UILayout.large,
                icon: Icon(
                  Icons.close,
                  color: TapBarColor.iconDefault.color,
                  size: UILayout.large,
                ),
                onPressed: () => context.pop(),
              ),
            ],
          ),
          Spacing.spacingV12,
          Text(
            localizations.filter_title,
            style: TextStyle(
              fontSize: UILayout.medium,
              fontWeight: FontWeight.bold,
              color: TextColors.textPrimary.color,
            ),
          ),
          Spacing.spacingV32,
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
          Spacing.spacingV16,
          const Divider(height: 1, color: Colors.borderDefault, thickness: 1),
          Spacing.spacingV16,
          if (_isExpanded)
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                itemCount: PokemonType.values.length,
                itemBuilder: (BuildContext context, int index) {
                  PokemonType pokemonType = PokemonType.values[index];
                  bool isSelected = _selected.contains(pokemonType.apiKey);

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
                            PokemonTypeHelper.getConfig(pokemonType).label,
                            style: TextStyle(
                              fontSize: UILayout.medium,
                              color: TextColors.textPrimary.color,
                            ),
                          ),
                          DecoratedBox(
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Azul.normal.color
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: isSelected
                                    ? Azul.normal.color
                                    : BorderColors.defaultColor.color,
                              ),
                            ),
                            child: SizedBox(
                              width: UILayout.medium,
                              height: UILayout.medium,
                              child: isSelected
                                  ? const Icon(
                                      Icons.check,
                                      size: UILayout.mediumText,
                                      color: Colors.white,
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
        ],
      ),
    );
  }
}
