import 'package:flutter/material.dart';
import '../components/home_components/item_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 80.0),
              child: Text(
                'HOW CAN I HELP YOU?',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).textTheme.bodyMedium!.color),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.001,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HomeItemLayout(
                  image: 'assets/images/winsh.jpg',
                  title: 'Winsh',
                  onTap: () {
                    ///ToDo: navigate ot Winsh_Screen
                  }),
              HomeItemLayout(
                image: 'assets/images/oil car icon.jpg',
                title: 'Oil & Gasoline',
                onTap: () {
                  ///ToDo: Navigate to Oil & Gasoline
                },
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HomeItemLayout(
                  onTap: () {
                    ///ToDo navigate to car repair screen
                  },
                  image: 'assets/images/workshop man.jpg',
                  title: 'Car repair'),
              HomeItemLayout(
                onTap: () {
                  ///ToDo navigate to shop screen
                },
                image: 'assets/images/winsh.jpg',
                title: 'Shop',
              ),
            ],
          ),
        ],
      ),
    );
  }
}


