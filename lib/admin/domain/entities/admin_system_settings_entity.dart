class AdminSystemSettingsEntity {
  final String cafeName;
  final String welcomeMessage;
  final double vatPercent;
  final double serviceChargePercent;
  final String printerType;
  final String printerStatus;
  final String printerIp;

  const AdminSystemSettingsEntity({
    required this.cafeName,
    required this.welcomeMessage,
    required this.vatPercent,
    required this.serviceChargePercent,
    required this.printerType,
    required this.printerStatus,
    required this.printerIp,
  });

  AdminSystemSettingsEntity copyWith({
    String? cafeName,
    String? welcomeMessage,
    double? vatPercent,
    double? serviceChargePercent,
    String? printerType,
    String? printerStatus,
    String? printerIp,
  }) {
    return AdminSystemSettingsEntity(
      cafeName: cafeName ?? this.cafeName,
      welcomeMessage: welcomeMessage ?? this.welcomeMessage,
      vatPercent: vatPercent ?? this.vatPercent,
      serviceChargePercent: serviceChargePercent ?? this.serviceChargePercent,
      printerType: printerType ?? this.printerType,
      printerStatus: printerStatus ?? this.printerStatus,
      printerIp: printerIp ?? this.printerIp,
    );
  }
}
