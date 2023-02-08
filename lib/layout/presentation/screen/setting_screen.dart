import 'package:flutter/material.dart';
import 'package:graduated_project_all_car_needs/authentication/presentation/components/global_componant/navigate_to.dart';
import 'package:graduated_project_all_car_needs/layout/presentation/screen/profile_screen.dart';
import '../components/setting_componetnts/setting_header.dart';
import '../components/setting_componetnts/setting_list_tile_item.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderLayout(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///Security Settings
                Text('Settings', style: Theme.of(context).textTheme.bodyMedium),
                SettingListTileItem(
                    title: 'Privacy Settings',
                    leading: const Icon(Icons.lock_open_outlined),
                    onTap: () {
                      navigateTo(context, ProfileScreen());
                    }),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),

                ///Theme Settings
                Text('App Mode', style: Theme.of(context).textTheme.bodyMedium),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.08,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 20, right: 35),
                          child: Icon(
                            Icons.brightness_2_outlined,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          'Theme Mode',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .color),
                        ),
                        const Spacer(),
                        Switch(
                          activeColor: Colors.green,
                          value: isSwitched,
                          onChanged: (value) {
                            setState(() {
                              isSwitched = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),

                ///Logout Settings
                Text('Leave App',
                    style: Theme.of(context).textTheme.bodyMedium),
                SettingListTileItem(
                  title: 'Log Out',
                  leading: const Icon(Icons.logout),
                  onTap: () {},
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
