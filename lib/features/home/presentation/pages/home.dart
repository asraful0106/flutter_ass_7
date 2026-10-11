import 'package:ass_3/core/widgets/action_bar.dart';
import 'package:ass_3/core/widgets/app_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // input filed keys
    final nameKey = GlobalKey<AppInputFieldState>();
    final phoneKey = GlobalKey<AppInputFieldState>();
    return Scaffold(
      appBar: AppActionBar(title: 'Contact List'),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
        child: Column(
          children: [
            // phone form
            Column(
              spacing: 15.h,
              children: [
                // Name
                AppInputField(
                  key: nameKey,
                  label: 'Name',
                  type: AppInputType.name,
                  isRequired: true,
                ),
                // Number
                AppInputField(
                  key: phoneKey,
                  label: 'Number',
                  type: AppInputType.phone,
                  isRequired: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
