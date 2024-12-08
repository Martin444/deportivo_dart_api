enum RolesUsers {
  costumer,
  club,
}

class RolesFuncionts {
  static RolesUsers? getTypeRoleByRoleString(String role) {
    RolesUsers? roles;
    for (var value in RolesUsers.values) {
      if (value.toString().split('.').last == role) {
        roles = value;
      }
    }
    return roles;
  }
}
