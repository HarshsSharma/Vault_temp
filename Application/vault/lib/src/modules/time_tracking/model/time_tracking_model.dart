import 'package:flutter/material.dart';

class TimeEntity {
  final String taskName;
  final Project project;
  final String note;
  final TimeOfDay start;
  final TimeOfDay end;

  TimeEntity(this.taskName, this.project, this.note, this.start, this.end);
}

class Project {
  final String name;
  final Color color;

  Project(this.name, this.color);
}
