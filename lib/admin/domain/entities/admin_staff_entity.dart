class AdminStaffEntity {
  final String id;
  final String name;
  final String role;
  final String pin;
  final bool isActive;
  final String? avatarUrl;

  const AdminStaffEntity({
    required this.id,
    required this.name,
    required this.role,
    required this.pin,
    this.isActive = true,
    this.avatarUrl,
  });

  AdminStaffEntity copyWith({
    String? id,
    String? name,
    String? role,
    String? pin,
    bool? isActive,
    String? avatarUrl,
  }) {
    return AdminStaffEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      role: role ?? this.role,
      pin: pin ?? this.pin,
      isActive: isActive ?? this.isActive,
      avatarUrl: avatarUrl ?? this.avatarUrl,
    );
  }
}
