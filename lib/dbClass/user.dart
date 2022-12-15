// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  int? phoneNum;
  String? interest;
  User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.phoneNum,
    this.interest,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'phoneNum': phoneNum,
      'interest': interest,
    };
  }

  userMap() {
    var mapping = Map<String, dynamic>();
    mapping['id'] = id ?? null;
    mapping['firstname'] = firstName;
    mapping['lastname'] = lastName;
    mapping['email'] = email;
    mapping['password'] = password;
    mapping['phoneNum'] = phoneNum;
    mapping['interest'] = interest;
    return mapping;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] != null ? map['id'] as int : null,
      firstName: map['firstName'] != null ? map['firstName'] as String : null,
      lastName: map['lastName'] != null ? map['lastName'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      phoneNum: map['phoneNum'] != null ? map['phoneNum'] as int : null,
      interest: map['interest'] != null ? map['interest'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  User copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    int? phoneNum,
    String? interest,
  }) {
    return User(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      phoneNum: phoneNum ?? this.phoneNum,
      interest: interest ?? this.interest,
    );
  }

  @override
  String toString() {
    return 'User(id: $id, firstName: $firstName, lastName: $lastName, email: $email, password: $password, phoneNum: $phoneNum, interest: $interest)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.email == email &&
        other.password == password &&
        other.phoneNum == phoneNum &&
        other.interest == interest;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        email.hashCode ^
        password.hashCode ^
        phoneNum.hashCode ^
        interest.hashCode;
  }
}
