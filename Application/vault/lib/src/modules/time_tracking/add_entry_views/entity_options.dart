import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vault/src/modules/time_tracking/view_model/time_tracking_controller.dart';

import '../widgets/radio_button.dart';

class EntryOptions extends StatelessWidget {
  const EntryOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<TimeTrackingViewModel>();
    return SingleChildScrollView(
      child: Column(
          children: viewModel.entites
              .map((e) => InkWell(
                    onTap: () {
                      context
                          .read<TimeTrackingViewModel>()
                          .changeRadioIndex(viewModel.entites.indexOf(e));
                      context
                          .read<TimeTrackingViewModel>()
                          .entityController
                          .text = e;
                    },
                    child: Column(
                      children: [
                        RadioOption(
                            isSelected: context
                                    .watch<TimeTrackingViewModel>()
                                    .selectedRadio ==
                                viewModel.entites.indexOf(e),
                            title: e),
                        if (viewModel.entites.last != e) const Divider()
                      ],
                    ),
                  ))
              .toList()),
    );
  }
}
