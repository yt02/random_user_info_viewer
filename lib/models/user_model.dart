//can use the json to dart tool to generate the model
class UserModel {
  final String name;
  final String email;
  final String phone;
  final String picture;
  final String location;
  final String username;
  final String password;
  final String uuid;
  final String birthday;
  final int age;

  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.picture,
    required this.location,
    required this.username,
    required this.password,
    required this.uuid,
    required this.birthday,
    required this.age,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final user = json['results'][0];
    final dob = user['dob'];
    final date = DateTime.parse(dob['date'].toString().split('T')[0]);
    
    return UserModel(
      name: '${user['name']['first']} ${user['name']['last']}',
      email: user['email'],
      phone: user['phone'],
      picture: user['picture']['large'],
      location: '${user['location']['city']}, ${user['location']['country']}',
      username: user['login']['username'],
      password: user['login']['password'],
      uuid: user['login']['uuid'],
      birthday: '${date.day}/${date.month}/${date.year}',
      age: dob['age'],
    );
  }
} 