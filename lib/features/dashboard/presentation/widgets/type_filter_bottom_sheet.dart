part of com.global66.home.widgets;

Future<Set<String>?> showTypeFilterBottomSheet(
  BuildContext context, {
  Set<String> initialSelected = const <String>{},
}) => showModalBottomSheet<Set<String>>(
  context: context,
  useRootNavigator: true,
  isScrollControlled: true,
  backgroundColor: Colors.white,
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

  void _toggleExpand() {
    setState(() => _isExpanded = !_isExpanded);
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations l10n = AppLocalizations.of(context)!;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: UILayout.medium),
        child: Column(
          children: <Widget>[
            Spacing.spacingV12,
            _Header(onClose: () => context.pop()),
            Spacing.spacingV12,

            Text(
              l10n.filter_title,
              style: TextStyle(
                fontSize: UILayout.medium,
                fontWeight: FontWeight.bold,
                color: TextColors.textPrimary.color,
              ),
            ),

            Spacing.spacingV32,

            _FilterSectionHeader(
              title: l10n.filter_type,
              expanded: _isExpanded,
              onTap: _toggleExpand,
            ),

            Spacing.spacingV16,

            const Divider(height: 1, color: Colors.borderDefault, thickness: 1),

            Spacing.spacingV16,

            if (_isExpanded)
              Expanded(
                child: ListView.builder(
                  itemCount: PokemonType.values.length,
                  itemBuilder: (BuildContext context, int index) {
                    PokemonType type = PokemonType.values[index];
                    bool isSelected = _selected.contains(type.apiKey);

                    return _PokemonTypeItem(
                      pokemonType: type,
                      isSelected: isSelected,
                      onTap: () => _toggle(type.apiKey),
                    );
                  },
                ),
              )
            else
              const Spacer(),

            Spacing.spacingV16,

            PrimaryButton(
              label: l10n.filter_apply,
              onPressed: () => Navigator.pop(context, _selected),
            ),

            Spacing.spacingV8,

            SecondaryButton(
              label: l10n.filter_cancel,
              onPressed: () => Navigator.pop(context),
            ),

            Spacing.spacingV24,
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.onClose});

  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) => Row(
    children: <Widget>[
      IconButton(
        padding: EdgeInsets.zero,
        iconSize: UILayout.large,
        icon: Icon(
          Icons.close,
          color: TapBarColor.iconDefault.color,
          size: UILayout.large,
        ),
        onPressed: onClose,
      ),
    ],
  );
}

class _FilterSectionHeader extends StatelessWidget {
  const _FilterSectionHeader({
    required this.title,
    required this.expanded,
    required this.onTap,
  });

  final String title;
  final bool expanded;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            fontSize: UILayout.medium,
            fontWeight: FontWeight.w600,
            color: TextColors.textPrimary.color,
          ),
        ),
        Icon(
          expanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
          color: TextColors.textSecondary.color,
        ),
      ],
    ),
  );
}

class _PokemonTypeItem extends StatelessWidget {
  const _PokemonTypeItem({
    required this.pokemonType,
    required this.isSelected,
    required this.onTap,
  });

  final PokemonType pokemonType;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    String label = PokemonTypeHelper.getConfig(pokemonType).label;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: UILayout.smallText),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              label,
              style: TextStyle(
                fontSize: UILayout.medium,
                color: TextColors.textPrimary.color,
              ),
            ),
            _Checkbox(isSelected: isSelected),
          ],
        ),
      ),
    );
  }
}

class _Checkbox extends StatelessWidget {
  const _Checkbox({required this.isSelected});

  final bool isSelected;

  @override
  Widget build(BuildContext context) => DecoratedBox(
    decoration: BoxDecoration(
      color: isSelected ? Azul.normal.color : Colors.white,
      borderRadius: BorderRadius.circular(4),
      border: Border.all(
        color: isSelected ? Azul.normal.color : BorderColors.defaultColor.color,
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
  );
}
