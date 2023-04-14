import 'package:flutter/material.dart';

class TimeOffModel {
  final String? type;
  final String? duration;
  final String? message;
  final String? status;
  final String? statusDate;
  final Widget? icon;
  TimeOffModel(this.duration, this.message,
      {this.type, this.status, this.statusDate, this.icon});
}
