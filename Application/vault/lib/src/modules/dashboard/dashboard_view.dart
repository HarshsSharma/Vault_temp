import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../../core/helper/extentions/media_query.dart';
import 'dashboard_controller.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F6F6),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff161652),
        toolbarHeight: kToolbarHeight,
        title: const Text('Dashboard'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.menu))],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Column(
            children: [
              if (!context.watch<DashBoardViewModel>().timeStatsExpanded)
                InkWell(
                  onTap: () {
                    context.read<DashBoardViewModel>().toggleTimeStats();
                  },
                  child: Slidable(
                    endActionPane: ActionPane(
                      extentRatio: .2,
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) {},
                          backgroundColor: Colors.transparent,
                          foregroundColor:
                              const Color.fromARGB(255, 19, 23, 30),
                          icon: Icons.tune_outlined,
                        ),
                      ],
                    ),
                    child: DashboardContainer(
                      child: Row(
                        children: [
                          const Icon(
                            Icons.emergency_sharp,
                            size: 20,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'Time Tracking Stats',
                            textScaleFactor: ScaleSize.textScaleFactor(context),
                            style: const TextStyle(fontSize: 16),
                          ),
                          const Spacer(),
                          Text(
                            '${6}h ${40}min',
                            textScaleFactor: ScaleSize.textScaleFactor(context),
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              if (context.watch<DashBoardViewModel>().timeStatsExpanded)
                DashboardContainer(
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          context.read<DashBoardViewModel>().toggleTimeStats();
                        },
                        child: Row(
                          children: [
                            const Icon(
                              Icons.emergency_sharp,
                              size: 20,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Time Tracking Stats',
                              textScaleFactor:
                                  ScaleSize.textScaleFactor(context),
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      TimeStatsItem(
                        hours: '6',
                        mins: '40',
                        label: 'Today',
                        mainColor: const Color(0xff14CB43),
                        secondColor: const Color(0xff14CB43).withOpacity(.16),
                        target: '8',
                        widthFactor: (6 * 60 + 40) / (8 * 60),
                      ),
                      TimeStatsItem(
                        hours: '22',
                        mins: '05',
                        label: 'This week',
                        mainColor: const Color(0xff505064),
                        secondColor: const Color(0xff505064).withOpacity(.16),
                        target: '40',
                        widthFactor: (22 * 60 + 5) / (40 * 60),
                      ),
                      TimeStatsItem(
                        hours: '61',
                        mins: '50',
                        label: 'This month',
                        mainColor: const Color(0xff505064),
                        secondColor: const Color(0xff505064).withOpacity(.16),
                        target: '160',
                        widthFactor: (61 * 60 + 50) / (160 * 60),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Time Tracking Level',
                            textScaleFactor: ScaleSize.textScaleFactor(context),
                            style: const TextStyle(
                                color: Color(0xff676A6C), fontSize: 16),
                          ),
                          Text(
                            'Very Good',
                            textScaleFactor: ScaleSize.textScaleFactor(context),
                            style: const TextStyle(
                                color: Color(0xff14CB43), fontSize: 16),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              if (!context.watch<DashBoardViewModel>().bankAccountsExpande)
                Slidable(
                  endActionPane: ActionPane(
                    extentRatio: .2,
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) {},
                        backgroundColor: Colors.transparent,
                        foregroundColor: const Color.fromARGB(255, 19, 23, 30),
                        icon: Icons.tune,
                      ),
                    ],
                  ),
                  child: DashboardContainer(
                    child: BankAcountsItem(
                      onTap: () {
                        context.read<DashBoardViewModel>().toggleBankAccounts();
                      },
                      image: 'assets/images/bank.PNG',
                      label: 'Bank Accounts',
                      value: '€23,114,742.02',
                    ),
                  ),
                ),
              if (context.watch<DashBoardViewModel>().bankAccountsExpande)
                DashboardContainer(
                    child: Column(
                  children: [
                    BankAcountsItem(
                      onTap: () {
                        context.read<DashBoardViewModel>().toggleBankAccounts();
                      },
                      image: 'assets/images/bank.PNG',
                      label: 'Bank Accounts',
                      value: '€23,114,742.02',
                    ),
                    Column(
                      children: const [
                        SizedBox(height: 20),
                        BankAcountsItem(
                          image: 'assets/images/rare.PNG',
                          label: 'Rare Crew - Slovakia',
                          value: '€23,114,742.02',
                        ),
                        Divider(),
                        BankAcountsItem(
                          image: 'assets/images/r.PNG',
                          label: 'Rapidd Technologies',
                          value: '€23,114,742.02',
                        ),
                        Divider(),
                        BankAcountsItem(
                          image: 'assets/images/rare.PNG',
                          label: 'Rare Crew - Serbia',
                          value: '€23,114,742.02',
                        ),
                      ],
                    ),
                  ],
                ))
            ],
          ),
        ),
      ),
    );
  }
}

class BankAcountsItem extends StatelessWidget {
  final String image;
  final String value;
  final String label;
  final VoidCallback? onTap;
  const BankAcountsItem({
    super.key,
    required this.image,
    required this.value,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: context.height * .04,
            height: context.height * .04,
          ),
          Text(
            label,
            textScaleFactor: ScaleSize.textScaleFactor(context),
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const Spacer(),
          Text(
            value,
            textScaleFactor: ScaleSize.textScaleFactor(context),
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class TimeStatsItem extends StatelessWidget {
  final String label;
  final String hours;
  final String mins;
  final String target;
  final double widthFactor;
  final Color mainColor;
  final Color secondColor;
  const TimeStatsItem({
    super.key,
    required this.label,
    required this.target,
    required this.widthFactor,
    required this.hours,
    required this.mins,
    required this.mainColor,
    required this.secondColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                label,
                textScaleFactor: ScaleSize.textScaleFactor(context),
                style: const TextStyle(color: Color(0xff676A6C), fontSize: 16),
              ),
              const Spacer(),
              Text(
                '${hours}h ${mins}min',
                textScaleFactor: ScaleSize.textScaleFactor(context),
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                ' (${target}h)',
                textScaleFactor: ScaleSize.textScaleFactor(context),
                style: const TextStyle(fontSize: 16, color: Color(0xff676A6C)),
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: double.infinity,
                color: secondColor,
                height: 3,
              ),
              LayoutBuilder(builder: (context, cons) {
                return Container(
                  margin: const EdgeInsets.only(top: 10),
                  height: 3,
                  width: widthFactor * cons.maxWidth,
                  color: mainColor,
                );
              }),
            ],
          ),
        ],
      ),
    );
  }
}

class DashboardContainer extends StatelessWidget {
  final Widget child;
  const DashboardContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xffE7EAEC)),
      ),
      child: child,
    );
  }
}
