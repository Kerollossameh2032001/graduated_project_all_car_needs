import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeItemLayout extends StatelessWidget {
  final void Function()? onTap;
  final String image;
  final String title;

  const HomeItemLayout({
    super.key,
    required this.onTap,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
      child: InkWell(
        onTap: onTap,
        splashColor: HexColor('#585858'),
        focusColor: HexColor('#585858'),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.18,
              width: MediaQuery.of(context).size.height * 0.18,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.black,
                ),
              ),
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
      ),
    );
  }
}