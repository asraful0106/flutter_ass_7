import 'package:ass_3/core/widgets/action_bar.dart';
import 'package:ass_3/core/widgets/app_button.dart';
import 'package:ass_3/core/widgets/app_input_field.dart';
import 'package:ass_3/features/home/presentation/widgets/contact_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Phone book
  List<Map<String, String>> phoneBook = [];

  // Input Keys
  final _nameKey = GlobalKey<AppInputFieldState>();
  final _phoneKey = GlobalKey<AppInputFieldState>();

  Future<String> _addPhone() async {
    await Future.delayed(const Duration(seconds: 1));

    final name = _nameKey.currentState?.text.trim() ?? '';
    final phone = _phoneKey.currentState?.text.trim() ?? '';

    // updating the map with state change
     setState(() {
      phoneBook.add({'name': name, 'phone_number': phone});
    });

    return "Success";
  }

  bool get _isValidForm =>
      (_nameKey.currentState?.isValid ?? false) &&
      (_phoneKey.currentState?.isValid ?? false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppActionBar(title: 'Contact List'),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
        child: Column(
          children: [
            Column(
              spacing: 15.h,
              children: [
                AppInputField(
                  key: _nameKey,
                  label: 'Name',
                  type: AppInputType.name,
                  isRequired: true,
                  // Rebuild so _isValidForm is re-evaluated on every keystroke.
                  // (Also fires when the clear button is tapped.)
                  onChanged: (_) => setState(() {}),
                ),
                AppInputField(
                  key: _phoneKey,
                  label: 'Number',
                  type: AppInputType.phone,
                  isRequired: true,
                  onChanged: (_) => setState(() {}),
                ),
                AppButton(
                  text: 'Add',
                  isActive: _isValidForm,
                  backgroundColor: const Color(0xFF5D7A8A),
                  onPressed: () async => await _addPhone(),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 25.h),
            ),
            // Each Contact 
            phoneBook.isEmpty
                ? Expanded(
                    child: Center(
                      child: Text(
                        "No Contact Found!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade600,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  )
                : SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: phoneBook.map((contact) {
                        return ContactWidget(contact: contact);
                      }).toList(),
                    ),
                  )

          ],
        ),
      ),
    );
  }
}
