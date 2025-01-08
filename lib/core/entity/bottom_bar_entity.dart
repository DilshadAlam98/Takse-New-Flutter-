class BottomBarEntity {
  final String label;
  final int index;

  BottomBarEntity({required this.label, required this.index});

  static List<BottomBarEntity> getBottomBarEntityFirst() {
    return [
      BottomBarEntity(label: "Home", index: 0),
      BottomBarEntity(label: "Help", index: 1),
      BottomBarEntity(label: "Wallet", index: 2),
      BottomBarEntity(label: "Training", index: 3),
      BottomBarEntity(label: "Profile", index: 4),
    ];
  }
}
