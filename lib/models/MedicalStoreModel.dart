import 'package:flutter_ayuvani/constant/AppConstant.dart';

class MedicalStoreModel {
  String name;
  String imageUrl;
  String address;
  double ratingStar;

  MedicalStoreModel({this.name, this.imageUrl, this.address, this.ratingStar});

  MedicalStoreModel.fromJson(Map<String, dynamic> json) {
    this.name = json['name'];
    this.imageUrl = json['imageUrl'];
    this.address = json['address'];
    this.ratingStar = json['ratingStar'];
  }
}

List<MedicalStoreModel> tempDataForMedicalStore = [
  MedicalStoreModel(
      name: 'Medical Store',
      address: 'Punjab Punjab',
      imageUrl: SampleProfileImageUrl,
      ratingStar: 5.0),
  MedicalStoreModel(
      name: 'Medical Store',
      address: 'Punjab Punjab',
      imageUrl: SampleProfileImageUrl,
      ratingStar: 5.0),
  MedicalStoreModel(
      name: 'Medical Store',
      address: 'Punjab Punjab',
      imageUrl: SampleProfileImageUrl,
      ratingStar: 5.0),
  MedicalStoreModel(
      name: 'Medical Store',
      address: 'Punjab Punjab',
      imageUrl: SampleProfileImageUrl,
      ratingStar: 5.0),
  MedicalStoreModel(
      name: 'Medical Store',
      address: 'Punjab Punjab',
      imageUrl: SampleProfileImageUrl,
      ratingStar: 5.0),
  MedicalStoreModel(
      name: 'Medical Store',
      address: 'Punjab Punjab',
      imageUrl: SampleProfileImageUrl,
      ratingStar: 5.0),
  MedicalStoreModel(
      name: 'Medical Store',
      address: 'Punjab Punjab',
      imageUrl: SampleProfileImageUrl,
      ratingStar: 5.0),
  MedicalStoreModel(
      name: 'Medical Store',
      address: 'Punjab Punjab',
      imageUrl: SampleProfileImageUrl,
      ratingStar: 5.0),
  MedicalStoreModel(
      name: 'Medical Store',
      address: 'Punjab Punjab',
      imageUrl: SampleProfileImageUrl,
      ratingStar: 5.0),
];
