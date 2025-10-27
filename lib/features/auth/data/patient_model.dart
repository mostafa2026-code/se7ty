class PatientModel {
  final String? name;
  final String? email;
  final String? password;
  final String? phone;
  final String? id;
  final String? age;
  final String? gender;
  final String? address;
  final String? profileImage;
  PatientModel({
    required this.name,
    required this.email,
    required this.password,
    this.phone,
    required this.id,
    this.age,
    this.gender,
    this.address,
    this.profileImage,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
      'id': id,
      'age': age,
      'gender': gender,
      'address': address,
      'profileImage': profileImage,
    };
  }

  factory PatientModel.fromMap(Map<String, dynamic> map) {
    return PatientModel(
      name: map['name'],
      email: map['email'],
      password: map['password'],
      phone: map['phone'],
      id: map['id'],
      age: map['age'],
      gender: map['gender'],
      address: map['address'],
      profileImage: map['profileImage'],
    );
  }

  PatientModel copyWith({
    String? name,
    String? email,
    String? password,
    String? phone,
    String? id,
    String? age,
    String? gender,
    String? address,
    String? profileImage,
  }) {
    return PatientModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      id: id ?? this.id,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      address: address ?? this.address,
      profileImage: profileImage ?? this.profileImage,
    );
  }
}
