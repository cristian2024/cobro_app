// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
   String name;
   String lastName;
   String? id;
   String cellphone;
   String email;
   String userName;
   DateTime? birthDate;

  UserType userType;
  UserModel({
    required this.name,
    required this.lastName,
    this.id,
    required this.cellphone,
    required this.email,
    required this.userName,
    required this.birthDate,
    required this.userType,
  });

  UserModel.initial({
    this.name='',
    this.lastName='',
    this.id,
    this.cellphone='',
    this.email='',
    this.userName = '',
    this.birthDate,
    this.userType =UserType.client,
  });
}

enum UserType {
  client,
  investor,
  responsible,
}
