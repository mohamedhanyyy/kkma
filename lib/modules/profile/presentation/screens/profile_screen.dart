import 'package:flutter/material.dart';
import 'package:kkma/services/shared_preferences/preferences_helper.dart';
import 'package:kkma/shared/widgets/custom_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text('حسابي'),
        ),
      ),
      body:    Center(
        child: CustomElevatedButton(
          color: Colors.red,
          borderColor: Colors.red,
          onTap: (){
          CacheHelper.logOut();
        },buttonText: 'تسجيل الخروج',),
      ),

    );
  }
}
