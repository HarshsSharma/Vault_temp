import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vault/src/modules/time_off/model/time_off_req_model.dart';

import '../model/time_off_model.dart';

class TimeOffViewModel extends ChangeNotifier {
  List<TimeOffModel> timesOff = [
    TimeOffModel('4 days (12-Nov-19 - 15-Nov-19)',
        'Approved by John Smith. Covered by Jane Doe.',
        icon: const FaIcon(
          FontAwesomeIcons.suitcase,
          color: Colors.blue,
          size: 20,
        ),
        status: 'Pending',
        statusDate: '01-Nov-19',
        type: 'Holiday'),
    TimeOffModel('4 days (12-Nov-19 - 15-Nov-19)',
        'Approved by John Smith. Covered by Jane Doe.',
        icon: const FaIcon(
          FontAwesomeIcons.hospital,
          color: Colors.purple,
          size: 20,
        ),
        status: 'Approved',
        statusDate: '01-Nov-19',
        type: 'Sickness Absence'),
    TimeOffModel('4 days (12-Nov-19 - 15-Nov-19)',
        'Approved by John Smith. Covered by Jane Doe.',
        icon: const FaIcon(
          FontAwesomeIcons.suitcase,
          color: Colors.blue,
          size: 20,
        ),
        status: 'Approved',
        statusDate: '01-Nov-19',
        type: 'Holiday'),
    TimeOffModel('4 days (12-Nov-19 - 15-Nov-19)',
        'Approved by John Smith. Covered by Jane Doe.',
        icon: const FaIcon(
          FontAwesomeIcons.suitcase,
          color: Colors.blue,
          size: 20,
        ),
        status: 'Approved',
        statusDate: '01-Nov-19',
        type: 'Holiday'),
    TimeOffModel('4 days (12-Nov-19 - 15-Nov-19)',
        'Approved by John Smith. Covered by Jane Doe.',
        icon: const FaIcon(
          FontAwesomeIcons.plane,
          size: 20,
          color: Colors.blue,
        ),
        status: 'Pending',
        statusDate: '01-Nov-19',
        type: 'Business Trip'),
    TimeOffModel('4 days (12-Nov-19 - 15-Nov-19)',
        'Approved by John Smith. Covered by Jane Doe.',
        icon: const FaIcon(
          FontAwesomeIcons.suitcase,
          color: Colors.blue,
          size: 20,
        ),
        status: 'Pending',
        statusDate: '01-Nov-19',
        type: 'Holiday'),
    TimeOffModel('4 days (12-Nov-19 - 15-Nov-19)',
        'Approved by John Smith. Covered by Jane Doe.',
        icon: const FaIcon(
          FontAwesomeIcons.suitcase,
          color: Colors.blue,
          size: 20,
        ),
        status: 'Pending',
        statusDate: '01-Nov-19',
        type: 'Holiday'),
    TimeOffModel('4 days (12-Nov-19 - 15-Nov-19)',
        'Approved by John Smith. Covered by Jane Doe.',
        icon: const FaIcon(
          FontAwesomeIcons.suitcase,
          color: Colors.blue,
          size: 20,
        ),
        status: 'Pending',
        statusDate: '01-Nov-19',
        type: 'Holiday'),
    TimeOffModel('4 days (12-Nov-19 - 15-Nov-19)',
        'Approved by John Smith. Covered by Jane Doe.',
        icon: const FaIcon(
          FontAwesomeIcons.suitcase,
          color: Colors.blue,
          size: 20,
        ),
        status: 'Pending',
        statusDate: '01-Nov-19',
        type: 'Holiday'),
  ];
  List<TimeOffReq> timesOffRequests = [
    TimeOffReq('Sebastian Bentley', 'Today', 'BG (RS)', 'Holiday',
        'Approved by John Smith. Covered by Jane Doe.', '01-Nov-19',
        icon: FontAwesomeIcons.suitcase),
    TimeOffReq(
        'Sloane Fritz',
        '3 days (01-Nov-19 - 03-Nov-19 )',
        'TR (SK)',
        'Business Trip',
        'Approved by John Smith. Covered by Jane Doe.',
        '01-Nov-19',
        icon: FontAwesomeIcons.plane),
    TimeOffReq(
        'Sloane Fritz',
        '6 days (01-Nov-19 - 06-Nov-19 )',
        'TR (SK)',
        'Sickness Absence',
        'Approved by John Smith. Covered by Jane Doe.',
        '01-Nov-19',
        icon: FontAwesomeIcons.hospital),
    TimeOffReq(
        'Sloane Fritz',
        '12 days (01-Nov-19 - 12-Nov-19 )',
        'BG (RS)',
        'Sickness Absence',
        'Approved by John Smith. Covered by Jane Doe.',
        '01-Nov-19',
        icon: FontAwesomeIcons.hospital),
    TimeOffReq(
        'Sloane Fritz',
        '8 days (01-Nov-19 - 08-Nov-19 )',
        'BG (RS)',
        'Business Trip',
        'Approved by John Smith. Covered by Jane Doe.',
        '01-Nov-19',
        icon: FontAwesomeIcons.plane),
    TimeOffReq('Sebastian Bentley', 'Today', 'BG (RS)', 'Holiday',
        'Approved by John Smith. Covered by Jane Doe.', '01-Nov-19'),
    TimeOffReq(
        'Sloane Fritz',
        '3 days (01-Nov-19 - 03-Nov-19 )',
        'TR (SK)',
        'Business Trip',
        'Approved by John Smith. Covered by Jane Doe.',
        '01-Nov-19',
        icon: FontAwesomeIcons.plane),
    TimeOffReq(
        'Sloane Fritz',
        '6 days (01-Nov-19 - 06-Nov-19 )',
        'TR (SK)',
        'Sickness Absence',
        'Approved by John Smith. Covered by Jane Doe.',
        '01-Nov-19',
        icon: FontAwesomeIcons.hospital),
    TimeOffReq(
        'Sloane Fritz',
        '12 days (01-Nov-19 - 12-Nov-19 )',
        'BG (RS)',
        'Sickness Absence',
        'Approved by John Smith. Covered by Jane Doe.',
        '01-Nov-19',
        icon: FontAwesomeIcons.hospital),
    TimeOffReq(
        'Sloane Fritz',
        '8 days (01-Nov-19 - 08-Nov-19 )',
        'BG (RS)',
        'Business Trip',
        'Approved by John Smith. Covered by Jane Doe.',
        '01-Nov-19',
        icon: FontAwesomeIcons.plane),
  ];

  int timeOffTab = 0;
  void toggleTimeOffTab(int index) {
    timeOffTab = index;
    notifyListeners();
  }
}
