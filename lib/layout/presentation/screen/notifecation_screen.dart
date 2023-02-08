import 'package:flutter/material.dart';
import 'package:graduation_project/components/widgets.dart';
import 'package:hexcolor/hexcolor.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.separated(
            itemBuilder: (context, index) => notificationDeniedBuilder(context),
            separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
            itemCount: 10));
  }
}

class notificationDeniedBuilder extends StatelessWidget {
  const notificationDeniedBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.15,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: HexColor('#CECECEB3'),
            border: Border.all(color: Colors.black)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black)),
                  child: const Icon(
                    Icons.person_outline,
                    size: 60,
                    color: Colors.black,
                  )),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Icon(
                      Icons.close_sharp,
                      color: Colors.red,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Denied',
                      style: TextStyle(
                          fontFamily: 'cairo-light',
                          fontSize: 15,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Text(
                  '(Service provider name) denied your request.',
                  maxLines: 1,
                  style: TextStyle(
                      fontFamily: 'cairo-light',
                      fontSize: 12,
                      overflow: TextOverflow.ellipsis),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
