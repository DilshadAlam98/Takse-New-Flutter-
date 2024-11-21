class UserTypeEntity {
  final String label;
  final String value;
  final int index;

  UserTypeEntity({
    required this.label,
    required this.index,
    required this.value,
  });

  static List<UserTypeEntity> getUserTypes() {
    return [
      UserTypeEntity(label: "Takse Business Partner (TCP)", value: "tcp", index: 0),
      UserTypeEntity(label: "Takse  Partner (TP)", value: "tp", index: 1),
    ];
  }
}
