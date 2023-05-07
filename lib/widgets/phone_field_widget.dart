import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class phone_text_field extends StatelessWidget {
  const phone_text_field({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: IntlPhoneField(
        disableLengthCheck: true,
        dropdownIcon: Icon(
          Icons.keyboard_arrow_down_rounded,
          color: Colors.grey,
          size: 20,
        ),
        style: TextStyle(fontSize: 13),
        textAlignVertical: TextAlignVertical.center,
        showDropdownIcon: true,
        flagsButtonMargin: EdgeInsets.only(left: 10),
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.white, width: 1)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.white, width: 1)),
          contentPadding: EdgeInsets.symmetric(vertical: 19),
          filled: true,
          fillColor: Colors.grey.withOpacity(0.2),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        ),
        initialCountryCode: 'PK',
        onChanged: (phone) {
          print(phone.completeNumber);
        },
      ),
    );
  }
}
