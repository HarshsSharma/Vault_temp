import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../add_time_entry_view.dart';
import '../view_model/time_tracking_controller.dart';
import '../widgets/radio_button.dart';

class SelectProjectView extends StatelessWidget {
  const SelectProjectView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<TimeTrackingViewModel>();
    return SingleChildScrollView(
      child: Column(
          children: viewModel.searchList
              .map((e) => InkWell(
                    onTap: () {
                      context
                          .read<TimeTrackingViewModel>()
                          .changeRadioIndex(viewModel.searchList.indexOf(e));
                      // context
                      //     .read<TimeTrackingViewModel>()
                      //     .otherControllers
                      //     .add();
                      if (context
                          .read<TimeTrackingViewModel>()
                          .otherFields
                          .isNotEmpty) {
                        context.read<TimeTrackingViewModel>().otherFields[0] =
                            EntryField(
                          controller: TextEditingController(text: e),
                          hint: 'Project',
                          onTap: () {},
                        );
                      } else {
                        context
                            .read<TimeTrackingViewModel>()
                            .otherFields
                            .add(EntryField(
                              controller: TextEditingController(text: e),
                              hint: 'Project',
                              onTap: () {},
                            ));
                      }
                    },
                    child: RadioOption(
                        isSelected: context
                                .watch<TimeTrackingViewModel>()
                                .selectedRadio ==
                            viewModel.searchList.indexOf(e),
                        title: e),
                  ))
              .toList()),
    );
  }
}
