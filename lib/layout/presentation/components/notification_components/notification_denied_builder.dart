import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class NotificationDeniedBuilder extends StatelessWidget {
  const NotificationDeniedBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.1,
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
                    shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(color: Colors.black)),
                  child: const Icon(
                    Icons.person_outline,
                    size: 55,
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