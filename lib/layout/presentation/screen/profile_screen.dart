import 'package:flutter/material.dart';
import 'package:graduated_project_all_car_needs/authentication/presentation/components/forgot_password_componants/confirm_button.dart';
import '../components/profile_component/update_form.dart';

class ProfileScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.3,
                vertical: MediaQuery.of(context).size.height * 0.1,
              ),
              child: const CircleAvatar(
                radius: 65,
                backgroundImage: AssetImage('assets/images/workshop man.jpg'),
              ),
            ),
            UpdateProfileForm(
              formKey: formKey,
              phoneController: phoneController,
              nameController: nameController,
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.15),
            ConfirmButton(formKey: formKey, onPressed: () {
              if(formKey.currentState!.validate()){}
            }),
          ],
        ),
      ),
    );
  }
}