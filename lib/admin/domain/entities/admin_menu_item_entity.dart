class AdminMenuItemEntity {
  final String id;
  final String name;
  final double price;
  final String category;
  final List<String> modifiers;

  const AdminMenuItemEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    this.modifiers = const [],
  });

  AdminMenuItemEntity copyWith({
    String? id,
    String? name,
    double? price,
    String? category,
    List<String>? modifiers,
  }) {
    return AdminMenuItemEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      category: category ?? this.category,
      modifiers: modifiers ?? this.modifiers,
    );
  }
}
