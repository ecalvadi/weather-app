class User {
  final String user;
  final String pass;
  final String name;

  User({required this.user, required this.pass, required this.name,});

  @override
  toString() => '$name';
}