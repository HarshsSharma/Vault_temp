import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:vault/src/modules/time_tracking/add_time_entry_view.dart';

import '../add_entry_views/add_note_view.dart';
import '../add_entry_views/add_time_slot_view.dart';
import '../add_entry_views/entity_options.dart';
import '../add_entry_views/select_project_view.dart';
import '../add_entry_views/select_task_view.dart';
import '../model/time_tracking_model.dart';

class TimeTrackingViewModel extends ChangeNotifier {
  final TextEditingController entityController = TextEditingController();
  final TextEditingController startController = TextEditingController();
  final TextEditingController endController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  void setDefaultTimes() {
    startController.text = '00 : 00';
    endController.text = '00 : 00';
  }

  void clear() {
    endController.clear();
    startController.clear();
    noteController.clear();
    entityController.clear();
    otherControllers.clear();
    otherFields.clear();
    selectedRadio = 0;
    currentView = 0;
    timeStart = true;
    notifyListeners();
  }

  int weekNumber = 1;
  void changeWeekNumber(int n) {
    weekNumber = n;
    notifyListeners();
  }

  List<TextEditingController> otherControllers = [];
  List<EntryField> otherFields = [];
  int dateSelected = DateTime.now().weekday;
  //int dateSelected = DateTime.now().weekday + 6;
  List<DateTime> getTheWeekDayes(DateTime d) {
    List<DateTime> dates = [];
    final start = d.subtract(Duration(days: d.weekday - 1));
    for (int i = 0; i < 7; i++) {
      dates.add(start.add(Duration(days: i)));
    }
    return dates;
  }

  getThe3WeeksDayes(DateTime d) {
    final start = d.subtract(Duration(days: d.weekday - 1));
    final startprevious = start.subtract(const Duration(days: 7));
    for (int i = 0; i < 21; i++) {
      threeWeeksDays.add(startprevious.add(Duration(days: i)));
    }
    log(threeWeeksDays.length.toString());
  }

  var threeWeeksDays = [];

  void goToTheCurrentTime(ScrollController controller) {
    final now = TimeOfDay.now();
    final startOffset = (now.hour * 60 + now.minute) * 2.0;
    controller.animateTo(startOffset - 50,
        duration: const Duration(milliseconds: 100), curve: Curves.easeOut);
  }

  List<List<TimeEntity>> items = [
    [
      TimeEntity(
        'Task Name',
        Project('Project Name', Colors.yellow),
        'note ' * 5,
        const TimeOfDay(hour: 16, minute: 30),
        const TimeOfDay(hour: 17, minute: 30),
      ),
      TimeEntity(
        'Task Name',
        Project('Project Name', Colors.black),
        'note ' * 5,
        const TimeOfDay(hour: 8, minute: 30),
        const TimeOfDay(hour: 9, minute: 30),
      ),
      TimeEntity(
        'Task Name',
        Project('Project Name', Colors.green),
        'note ' * 5,
        const TimeOfDay(hour: 12, minute: 30),
        const TimeOfDay(hour: 14, minute: 0),
      ),
      TimeEntity(
        'Task Name',
        Project('Project Name', Colors.red),
        'note ' * 5,
        const TimeOfDay(hour: 20, minute: 0),
        const TimeOfDay(hour: 21, minute: 30),
      )
    ],
    [
      TimeEntity(
        'Task Name',
        Project('Project Name', Colors.yellow),
        'note ' * 5,
        const TimeOfDay(hour: 16, minute: 30),
        const TimeOfDay(hour: 17, minute: 30),
      ),
      TimeEntity(
        'Task Name New',
        Project('Project Name New', Colors.purple),
        'note ' * 5,
        const TimeOfDay(hour: 2, minute: 0),
        const TimeOfDay(hour: 3, minute: 0),
      ),
      TimeEntity(
        'Task Name',
        Project('Project Name', Colors.green),
        'note ' * 5,
        const TimeOfDay(hour: 12, minute: 30),
        const TimeOfDay(hour: 14, minute: 30),
      ),
      TimeEntity(
        'Task Name',
        Project('Project Name', Colors.red),
        'note ' * 5,
        const TimeOfDay(hour: 6, minute: 30),
        const TimeOfDay(hour: 8, minute: 0),
      ),
      TimeEntity(
        'Task Name',
        Project('Project Name', Colors.green),
        'note ' * 5,
        const TimeOfDay(hour: 20, minute: 0),
        const TimeOfDay(hour: 21, minute: 30),
      )
    ],
    [
      TimeEntity(
        'Task Name',
        Project('Project Name', Colors.red),
        'note ' * 5,
        const TimeOfDay(hour: 0, minute: 0),
        const TimeOfDay(hour: 0, minute: 30),
      ),
      TimeEntity(
        'Task Name New',
        Project('Project Name New', Colors.purple),
        'note ' * 5,
        const TimeOfDay(hour: 2, minute: 0),
        const TimeOfDay(hour: 3, minute: 0),
      ),
      TimeEntity(
        'Task Name',
        Project('Project Name', Colors.yellow),
        'note ' * 5,
        const TimeOfDay(hour: 4, minute: 30),
        const TimeOfDay(hour: 5, minute: 30),
      ),
      TimeEntity(
        'Task Name',
        Project('Project Name', Colors.green),
        'note ' * 5,
        const TimeOfDay(hour: 9, minute: 30),
        const TimeOfDay(hour: 11, minute: 0),
      ),
      TimeEntity(
        'Task Name',
        Project('Project Name', Colors.black),
        'note ' * 5,
        const TimeOfDay(hour: 15, minute: 0),
        const TimeOfDay(hour: 16, minute: 30),
      )
    ],
    [
      TimeEntity(
        'Task Name',
        Project('Project Name', Colors.green),
        'note ' * 5,
        const TimeOfDay(hour: 16, minute: 30),
        const TimeOfDay(hour: 17, minute: 30),
      ),
      TimeEntity(
        'Task Name',
        Project('Project Name', Colors.yellow),
        'note ' * 5,
        const TimeOfDay(hour: 8, minute: 30),
        const TimeOfDay(hour: 9, minute: 30),
      ),
      TimeEntity(
        'Task Name',
        Project('Project Name', Colors.red),
        'note ' * 5,
        const TimeOfDay(hour: 12, minute: 30),
        const TimeOfDay(hour: 14, minute: 0),
      ),
      TimeEntity(
        'Task Name',
        Project('Project Name', Colors.black),
        'note ' * 5,
        const TimeOfDay(hour: 20, minute: 0),
        const TimeOfDay(hour: 21, minute: 30),
      )
    ],
    [
      TimeEntity(
        'Task Name',
        Project('Project Name', Colors.yellow),
        'note ' * 5,
        const TimeOfDay(hour: 2, minute: 30),
        const TimeOfDay(hour: 4, minute: 30),
      ),
      TimeEntity(
        'Task Name',
        Project('Project Name', Colors.black),
        'note ' * 5,
        const TimeOfDay(hour: 11, minute: 0),
        const TimeOfDay(hour: 11, minute: 30),
      ),
      TimeEntity(
        'Task Name',
        Project('Project Name', Colors.green),
        'note ' * 5,
        const TimeOfDay(hour: 12, minute: 30),
        const TimeOfDay(hour: 14, minute: 0),
      ),
      TimeEntity(
        'Task Name',
        Project('Project Name', Colors.red),
        'note ' * 5,
        const TimeOfDay(hour: 20, minute: 0),
        const TimeOfDay(hour: 21, minute: 30),
      )
    ],
    [
      TimeEntity(
        'Task Name',
        Project('Project Name', Colors.yellow),
        'note ' * 5,
        const TimeOfDay(hour: 9, minute: 30),
        const TimeOfDay(hour: 10, minute: 30),
      ),
      TimeEntity(
        'Task Name',
        Project('Project Name', Colors.black),
        'note ' * 5,
        const TimeOfDay(hour: 11, minute: 0),
        const TimeOfDay(hour: 11, minute: 30),
      ),
      TimeEntity(
        'Task Name',
        Project('Project Name', Colors.green),
        'note ' * 5,
        const TimeOfDay(hour: 12, minute: 30),
        const TimeOfDay(hour: 14, minute: 0),
      ),
      TimeEntity(
        'Task Name',
        Project('Project Name', Colors.red),
        'note ' * 5,
        const TimeOfDay(hour: 20, minute: 0),
        const TimeOfDay(hour: 21, minute: 30),
      )
    ],
    [
      TimeEntity(
        'Task Name',
        Project('Project Name', Colors.yellow),
        'note ' * 5,
        const TimeOfDay(hour: 9, minute: 30),
        const TimeOfDay(hour: 10, minute: 30),
      ),
      TimeEntity(
        'Task Name',
        Project('Project Name', Colors.black),
        'note ' * 5,
        const TimeOfDay(hour: 11, minute: 0),
        const TimeOfDay(hour: 11, minute: 30),
      ),
      TimeEntity(
        'Task Name',
        Project('Project Name', Colors.green),
        'note ' * 5,
        const TimeOfDay(hour: 12, minute: 30),
        const TimeOfDay(hour: 14, minute: 0),
      ),
      TimeEntity(
        'Task Name',
        Project('Project Name', Colors.red),
        'note ' * 5,
        const TimeOfDay(hour: 0, minute: 0),
        const TimeOfDay(hour: 1, minute: 30),
      )
    ],
  ];

  DateTime currentDate = DateTime.now();
  void selectDay(int index, DateTime d) {
    dateSelected = index;
    currentDate = d;
    notifyListeners();
  }

  bool isToday(day) {
    return DateTime(day.year, day.month, day.day)
            .difference(DateTime(
                DateTime.now().year, DateTime.now().month, DateTime.now().day))
            .inDays ==
        0;
  }

  int selectedRadio = -5;

  void changeRadioIndex(int index) {
    selectedRadio = index;
    notifyListeners();
  }

  int currentView = 0;
  List<String> entryViewsTitles = [
    'Select Entity',
    'Select Project',
    'Select Task',
    'Add Time Slot',
    'Add Note',
  ];

  List<String> searchList = [];

  List<String> entites = [
    'Personnel',
    'Project',
    'Office',
    'Client',
    'Candidate',
    'Contract',
    'Opportunity'
  ];
  List<String> projects = [
    'IMG-Academies CRM',
    'IMG-Models',
    'Global CRM',
    'eLicensing',
    'Learfield Mogo',
    'Learfield Pennant',
  ];
  List<String> tasks = [
    '#30433-3035-Various support issues',
    '#30433-3005-Lorem ipsum task',
    'Meeting',
    'Documentation',
    'Daily Scrum',
  ];

  projectsSearch(String value) {
    searchList = projects
        .where((element) => element.toLowerCase().contains(value.toLowerCase()))
        .toList();
    notifyListeners();
  }

  tasksSearch(String value) {
    searchList = tasks
        .where((element) => element.toLowerCase().contains(value.toLowerCase()))
        .toList();
    notifyListeners();
  }

  void changeCurrentViewIndex(int index) {
    currentView += index;

    if (currentView == 1) {
      searchList = projects;
    } else if (currentView == 2) {
      searchList = tasks;
    }
    selectedRadio = -5;
    notifyListeners();
  }

  List<Widget> entryViews = [
    const EntryOptions(),
    const SelectProjectView(),
    const SelectTaskView(),
    const AddTimeslotView(),
    const AddNoteView(),
  ];

  bool timeStart = true;
  void toggleStartEndTime() {
    timeStart = !timeStart;
    notifyListeners();
  }

  void beTimeStart() {
    timeStart = true;
    notifyListeners();
  }

  double currentHourIndex = 0;
  double currentMinIndex = 0;
  addTimesTocontroller() {
    if (timeStart) {
      startController.text =
          '${(currentHourIndex.toInt()).toString().padLeft(2, '0')} : ${(currentMinIndex.toInt()).toString().padLeft(2, '0')}';
      endController.text =
          '${(currentHourIndex.toInt()).toString().padLeft(2, '0')} : ${(currentMinIndex.toInt()).toString().padLeft(2, '0')}';
    } else {
      endController.text =
          '${(currentHourIndex.toInt()).toString().padLeft(2, '0')} : ${(currentMinIndex.toInt()).toString().padLeft(2, '0')}';
    }
  }

  indicateTheCurrentElement(ScrollController controller, bool hours) {
    if (!controller.position.isScrollingNotifier.value) {
      if (controller.offset % 30 > 15) {
        controller.animateTo(((controller.offset ~/ 30 * 30)),
            duration: const Duration(milliseconds: 200),
            curve: Curves.bounceInOut);
      } else {
        controller.animateTo(((controller.offset ~/ 30 * 30)),
            duration: const Duration(milliseconds: 200),
            curve: Curves.bounceInOut);
      }

      if (hours) {
        currentHourIndex = controller.offset / 30;
      } else {
        currentMinIndex = controller.offset / 30;
      }
      notifyListeners();
      addTimesTocontroller();
    }
  }
}
