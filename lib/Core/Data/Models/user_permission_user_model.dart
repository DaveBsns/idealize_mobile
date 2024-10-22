class UsersPermissionsUser {
  int id;
  String username;
  String email;
  String provider;
  bool confirmed;
  bool blocked;
  String firstname;
  String surname;

  UsersPermissionsUser({
    required this.id,
    required this.username,
    required this.email,
    required this.provider,
    required this.confirmed,
    required this.blocked,
    required this.firstname,
    required this.surname,
  });

  factory UsersPermissionsUser.fromJson(Map<String, dynamic> json) {
    return UsersPermissionsUser(
      id: json['id'],
      username: json.containsKey('attributes')
          ? json['attributes']['username']
          : json['username'],
      email: json.containsKey('attributes')
          ? json['attributes']['email']
          : json['email'],
      provider: json.containsKey('attributes')
          ? json['attributes']['provider']
          : json['provider'],
      confirmed: json.containsKey('attributes')
          ? json['attributes']['confirmed']
          : json['confirmed'],
      blocked: json.containsKey('attributes')
          ? json['attributes']['blocked']
          : json['blocked'],
      firstname: json.containsKey('attributes')
          ? json['attributes']['firstname']
          : json['firstname'],
      surname: json.containsKey('attributes')
          ? json['attributes']['surname']
          : json['surname'],
    );
  }
}
