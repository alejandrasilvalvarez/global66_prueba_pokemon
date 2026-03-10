part of com.global66.home.widgets;

// TODO: implement Bottomsheet
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

    return Column(children: [
              ],
    );
  }
}
