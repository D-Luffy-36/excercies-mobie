// import 'package:json_annotation/json_annotation.dart';
//
// part 'user.g.dart'; // Phải có dòng này để Dart biết cần generate file
//

class User{
  final int? id;
  final String? fullName;
  final int age = 0;
  final String phoneNumber;
  final String? address;
  final String? password;
  final DateTime? dateOfBirth;
  final String? faceBookAccountId;
  final String? googleAccountId;
  final bool? isActive;
  final String? avatarUrl;

  User({
    this.id,
    required this.fullName,
    required this.phoneNumber,
    this.address,
    this.password,
    this.dateOfBirth,
    this.faceBookAccountId,
    this.googleAccountId,
    this.isActive,
    this.avatarUrl
  });

}