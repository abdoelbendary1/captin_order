abstract class AdminTeamEvent {
  const AdminTeamEvent();
}

class LoadAdminTeamDataEvent extends AdminTeamEvent {
  const LoadAdminTeamDataEvent();
}

class SwitchTeamTabEvent extends AdminTeamEvent {
  final int tabIndex; // 0 for Staff Directory, 1 for Audit Log
  const SwitchTeamTabEvent(this.tabIndex);
}

class AddStaffMemberEvent extends AdminTeamEvent {
  final String name;
  final String role;
  final String pin;

  const AddStaffMemberEvent({
    required this.name,
    required this.role,
    required this.pin,
  });
}
