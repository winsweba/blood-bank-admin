import 'package:flutter/material.dart';

import '../widgets/all_blood_needed_widget.dart';
import '../widgets/all_donations_widget.dart';
import '../widgets/blood_available.dart';

List<String> titles = <String>[
  'Donors',
  'In Need',
  'Available',
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // final ColorScheme colorScheme = Theme.of(context).colorScheme;
    // final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    // final Color evenItemColor = colorScheme.primary.withOpacity(0.15);
    const int tabsCount = 3;

    return DefaultTabController(
      initialIndex: 1,
      length: tabsCount,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
          // This check specifies which nested Scrollable's scroll notification
          // should be listened to.
          //
          // When `ThemeData.useMaterial3` is true and scroll view has
          // scrolled underneath the app bar, this updates the app bar
          // background color and elevation.
          //
          // This sets `notification.depth == 1` to listen to the scroll
          // notification from the nested `ListView.builder`.
          notificationPredicate: (ScrollNotification notification) {
            return notification.depth == 1;
          },
          // The elevation value of the app bar when scroll view has
          // scrolled underneath the app bar.
          scrolledUnderElevation: 4.0,
          shadowColor: Theme.of(context).shadowColor,
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                // icon: const Icon(Icons.cloud_outlined),
                text: titles[0],
              ),
              Tab(
                // icon: const Icon(Icons.beach_access_sharp),
                text: titles[1],
              ),
              Tab(
                // icon: const Icon(Icons.brightness_5_sharp),
                text: titles[2],
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            AllDonationsWidget(),
            AllBloodNeeded(),
            // BloodAvailable()
            PieChartSample3(),
          ],
        ),
      ),
    );
  }
}
