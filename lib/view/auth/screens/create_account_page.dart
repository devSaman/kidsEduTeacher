import 'package:flutter/material.dart';
import 'package:kids_edu_teacher/constants/colors.dart';

class CreateAccountPage extends StatefulWidget {
  static const routeName = '/createAccountPage';

  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Pallate.blackColor),
      ),
    );
  }
}
