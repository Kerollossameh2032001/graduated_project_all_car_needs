import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../components/notification_components/notification_accept_builder.dart';
import '../components/notification_components/notification_denied_builder.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.separated(
      itemBuilder: (context, index) => index % 2 == 0
          ? const NotificationDeniedBuilder()
          : const NotificationAcceptBuilder(),
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemCount: 10,
    ));
  }
}
