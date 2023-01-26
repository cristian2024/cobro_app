// ignore_for_file: public_member_api_docs, sort_constructors_first
class AccountModel {
  String name;
  String? imgUrl;
  double initialValue;
  DateTime? creationTime;
  double interest;
  bool isCompound;

  AccountModel({
    required this.name,
    this.imgUrl,
    this.initialValue = 0,
    this.creationTime,
    this.interest = 0,
    this.isCompound = false,
  });
}
