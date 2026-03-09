class NavigationState {
  NavigationState({this.selectedIndex = 0});
  final int selectedIndex;

  NavigationState copyWith({int? selectedIndex}) =>
      NavigationState(selectedIndex: selectedIndex ?? this.selectedIndex);
}
