import 'package:flutter/material.dart';

class TimeOffReq {
  final String? name;
  final String? type;
  final String? message;
  final String? date;
  final String? duration;
  final IconData? icon;
  final String country;
  TimeOffReq(this.name, this.duration, this.country, this.type, this.message,
      this.date,
      {this.icon});
}
