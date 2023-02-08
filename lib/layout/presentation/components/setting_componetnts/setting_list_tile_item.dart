import 'package:flutter/material.dart';

class SettingListTileItem extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  final Widget leading;

  const SettingListTileItem({
    super.key,
    this.onTap,
    required this.title,
    required this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.075,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: ListTile(
          onTap: onTap,
          leading: leading,
          title: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Theme.of(context).textTheme.bodyMedium!.color),
          ),
        ),
      ),
    );
  }
}