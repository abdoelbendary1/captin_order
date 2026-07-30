class AdminZoneEntity {
  final String id;
  final String name;
  final bool isSelected;

  const AdminZoneEntity({
    required this.id,
    required this.name,
    this.isSelected = false,
  });

  AdminZoneEntity copyWith({
    String? id,
    String? name,
    bool? isSelected,
  }) {
    return AdminZoneEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
