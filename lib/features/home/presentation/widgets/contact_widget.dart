import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactWidget extends StatelessWidget {
  final Map<String, String> contact;
  const ContactWidget({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin:  EdgeInsets.symmetric(horizontal: 0, vertical: 5.h),
      child: ListTile(
        leading: CircleAvatar(
          child: Text((contact['name'] ?? '?')[0]),
        ),
        title: Text(
          contact['name'] ?? 'Unknown',
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(contact['phone_number'] ?? ''),
        trailing: const Icon(Icons.phone),
      ),
    );
  }
}