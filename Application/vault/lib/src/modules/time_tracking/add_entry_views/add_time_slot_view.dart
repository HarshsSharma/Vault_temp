import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vault/src/modules/time_tracking/view_model/time_tracking_controller.dart';

import '../add_time_entry_view.dart';

class AddTimeslotView extends StatefulWidget {
  const AddTimeslotView({super.key});

  @override
  State<AddTimeslotView> createState() => _AddTimeslotViewState();
}

class _AddTimeslotViewState extends State<AddTimeslotView> {
  final ScrollController _hoursControllers = ScrollController();
  final ScrollController _minutesControllers = ScrollController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (context.read<TimeTrackingViewModel>().startController.text.isEmpty) {
        context.read<TimeTrackingViewModel>().setDefaultTimes();
      }

      _hoursControllers.position.isScrollingNotifier.addListener(() {
        context
            .read<TimeTrackingViewModel>()
            .indicateTheCurrentElement(_hoursControllers, true);
      });
      _minutesControllers.position.isScrollingNotifier.addListener(() {
        context
            .read<TimeTrackingViewModel>()
            .indicateTheCurrentElement(_minutesControllers, false);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                children: [
                  TimeStartOrEnd(
                    isSelcted: context.watch<TimeTrackingViewModel>().timeStart,
                    title: 'Start Time',
                  ),
                  TimeStartOrEnd(
                    isSelcted:
                        !context.watch<TimeTrackingViewModel>().timeStart,
                    title: 'End Time',
                  ),
                ],
              ),
              CalendarDatePicker(
                  onDateChanged: (value) {},
                  initialDate:
                      context.read<TimeTrackingViewModel>().currentDate,
                  firstDate: context.read<TimeTrackingViewModel>().currentDate,
                  lastDate: context.read<TimeTrackingViewModel>().currentDate),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    Expanded(
                        child: Center(
                      child: SizedBox(
                        height: 90,
                        child: ListView(
                          controller: _hoursControllers,
                          children: [
                            const SizedBox(height: 30),
                            ...List.generate(
                                25,
                                (index) => SizedBox(
                                      height: 30,
                                      child: Text(
                                        (index).toString().padLeft(2, '0'),
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            fontSize: 26,
                                            color: index ==
                                                    context
                                                        .watch<
                                                            TimeTrackingViewModel>()
                                                        .currentHourIndex
                                                ? Colors.green
                                                : Colors.grey),
                                      ),
                                    )),
                            const SizedBox(height: 30)
                          ],
                        ),
                      ),
                    )),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        ':',
                        style: TextStyle(fontSize: 26),
                      ),
                    ),
                    Expanded(
                        child: Center(
                      child: SizedBox(
                        height: 90,
                        child: Center(
                          child: ListView(
                              controller: _minutesControllers,
                              children: [
                                const SizedBox(height: 30),
                                ...List.generate(
                                    60,
                                    (index) => SizedBox(
                                          height: 30,
                                          child: Text(
                                            (index).toString().padLeft(2, '0'),
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontSize: 26,
                                                color: index ==
                                                        context
                                                            .watch<
                                                                TimeTrackingViewModel>()
                                                            .currentMinIndex
                                                    ? Colors.green
                                                    : Colors.grey),
                                          ),
                                        )),
                                const SizedBox(height: 30)
                              ]),
                        ),
                      ),
                    )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _hoursControllers.dispose();
    _minutesControllers.dispose();
    super.dispose();
  }
}

class TimeStartOrEnd extends StatelessWidget {
  final String title;
  final bool isSelcted;
  const TimeStartOrEnd({
    super.key,
    required this.title,
    required this.isSelcted,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: InkWell(
      onTap: () {
        context.read<TimeTrackingViewModel>().toggleStartEndTime();
      },
      child: Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelcted ? primaryColor : Colors.grey,
            ),
            color: isSelcted ? primaryColor : Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.grey, fontSize: 18),
              ),
              Text(
                DateFormat('dd-MMM-yy')
                    .format(context.read<TimeTrackingViewModel>().currentDate),
                style: TextStyle(
                    color: isSelcted ? Colors.white : Colors.black,
                    fontSize: 20,
                    height: 1.7),
              ),
            ],
          )),
    ));
  }
}
