class DoctorsModel {
  final String? name;
  final String? email;
  final String? password;
  final String? phone;
  final String? id;
  final String? age;
  final String? gender;
  final String? address;
  final String? profileImage;
  final String? specialization;
  final String? experience;
  final String? about;
  final String? degree;
  final String? hospital;
  final String? location;
  final String? fees;
  final List<String>? certification;

  const DoctorsModel({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.id,
    this.age,
    required this.gender,
    this.address,
    this.profileImage,
    required this.specialization,
     this.experience,
    this.about,
    required this.degree,
    required this.hospital,
    this.location,
    this.fees,
    this.certification,
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
      'specialization': specialization,
      'experience': experience,
      'about': about,
      'degree': degree,
      'hospital': hospital,
      'location': location,
      'fees': fees,
      'certification': certification,
    };
  }

  factory DoctorsModel.fromMap(Map<String, dynamic> map) {
    return DoctorsModel(
      name: map['name'],
      email: map['email'],
      password: map['password'],
      phone: map['phone'],
      id: map['id'],
      age: map['age'],
      gender: map['gender'],
      address: map['address'],
      profileImage: map['profileImage'],
      specialization: map['specialization'],
      experience: map['experience'],
      about: map['about'],
      degree: map['degree'],
      hospital: map['hospital'],
      location: map['location'],
      fees: map['fees'],
      certification: List<String>.from(map['certification']),
    );
  }

  DoctorsModel copyWith({
    String? name,
    String? email,
    String? password,
    String? phone,
    String? id,
    String? age,
    String? gender,
    String? address,
    String? profileImage,
    String? specialization,
    String? experience,
    String? about,

    String? degree,
    String? hospital,
    String? location,
    String? fees,
    List<String>? certification,
  }) {
    return DoctorsModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      id: id ?? this.id,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      address: address ?? this.address,
      profileImage: profileImage ?? this.profileImage,
      specialization: specialization ?? this.specialization,
      experience: experience ?? this.experience,
      about: about ?? this.about,
      degree: degree ?? this.degree,
      hospital: hospital ?? this.hospital,
      location: location ?? this.location,
      fees: fees ?? this.fees,
      certification: certification ?? this.certification,
    );
  }
}
