class DoctorsModel {
  final String? name;
  final String? email;
  final String? password;
  final String? phone1;
  final String? phone2;
  final String? id;

  final String? profileImage;
  final String? specialization;
  final String? fromhour;
  final String? tohour;
  final String? about;
  final String? location;
  final int? rating;
  DoctorsModel({
    this.name,
    this.email,
    this.password,
    this.phone1,
    this.phone2,
    this.id,
    this.profileImage,
    this.specialization,
    this.fromhour,
    this.tohour,
    this.about,
    this.location,
    this.rating,
  });

  DoctorsModel.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      email = json['email'],
      password = json['password'],
      phone1 = json['phone1'],
      phone2 = json['phone2'],
      id = json['id'],
      profileImage = json['profileImage'],
      specialization = json['specialization'],
      fromhour = json['fromhour'],
      tohour = json['tohour'],
      about = json['about'],
      location = json['location'],
      rating = json['rating'];

  Map<String, dynamic> toMap() => {
    'name': name,
    'email': email,
    'password': password,
    'phone1': phone1,
    'phone2': phone2,
    'id': id,
    'profileImage': profileImage,
    'specialization': specialization,
    'fromhour': fromhour,
    'tohour': tohour,
    'about': about,
    'location': location,
    'rating': rating,
  };

  DoctorsModel copyWith({
    String? name,
    String? email,
    String? password,
    String? phone1,
    String? phone2,
    String? id,

    String? profileImage,
    String? specialization,

    String? fromhour,
    String? tohour,
    String? about,
    String? location,
    int? rating,
  }) {
    return DoctorsModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      phone1: phone1 ?? this.phone1,
      phone2: phone2 ?? this.phone2,
      id: id ?? this.id,

      profileImage: profileImage ?? this.profileImage,

      specialization: specialization ?? this.specialization,

      fromhour: fromhour ?? this.fromhour,
      tohour: tohour ?? this.tohour,
      about: about ?? this.about,
      location: location ?? this.location,
      rating: rating ?? this.rating,
    );
  }
}
