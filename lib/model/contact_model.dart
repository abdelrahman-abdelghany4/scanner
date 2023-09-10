import 'package:hive/hive.dart';
part 'contact_model.g.dart';
@HiveType(typeId: 1)
class ContactModel extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String gender;
  @HiveField(2)
  String countryCode;
  @HiveField(3)
  String dateOfBirth;
  @HiveField(4)
  String expiryDate;
  @HiveField(5)
  String docNum;

  ContactModel(
      {required this.name,
      required this.gender,
      required this.countryCode,
      required this.dateOfBirth,
      required this.expiryDate,
      required this.docNum});

  factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
        name: json['name'],
        gender: json['gender'],
        countryCode: json['countryCode'],
        dateOfBirth: json['dateOfBirth'],
        expiryDate: json['expiryDate'],
        docNum: json['docNum'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'gender': gender,
        'countryCode': countryCode,
        'dateOfBirth': dateOfBirth,
        'expiryDate': expiryDate,
        'docNum': docNum,
      };
}
