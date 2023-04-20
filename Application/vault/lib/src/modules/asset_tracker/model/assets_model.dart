import 'package:flutter/material.dart';

class AssetsModel {
  final String tagNumber;
  final String type;
  final String modelName;
  final String serialNumber;
  final String displayName;
  final String latitude;
  final String longtiude;
  final String address;
  final Color color;
  AssetsModel(
    this.color,
    this.type, {
    required this.tagNumber,
    required this.modelName,
    required this.serialNumber,
    required this.displayName,
    required this.latitude,
    required this.longtiude,
    required this.address,
  });
}
