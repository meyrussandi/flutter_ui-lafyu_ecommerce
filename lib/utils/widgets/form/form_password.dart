import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_lafyu_e_commerce/app/data/helpers/regex.dart';
import 'package:flutter_ui_lafyu_e_commerce/app/data/theme/colors.dart';
import 'package:flutter_ui_lafyu_e_commerce/app/data/theme/data.dart';
import 'package:flutter_ui_lafyu_e_commerce/app/data/theme/theme.dart';

class FormPassword extends StatefulWidget {
  final String hintText;
  final String? Function(String?)? validate;
  final Function(String) onChange;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String label;
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;

  const FormPassword({
    this.hintText = '',
    this.validate,
    required this.onChange,
    this.prefixIcon,
    this.suffixIcon,
    this.label = '',
    required this.controller,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.none,
  });

  @override
  _FormPasswordState createState() => _FormPasswordState();
}

class _FormPasswordState extends State<FormPassword> {
  bool _obsecureText = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Insets.med),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          widget.label != ''
              ? Container(
                  margin: EdgeInsets.only(
                    bottom: Insets.xs,
                  ),
                  child: Text(
                    widget.label,
                    style: TextStyles.normalText1,
                  ),
                )
              : verticalSpace(0),
          TextFormField(
            enableInteractiveSelection: true,
            cursorColor: MyColors.blueColor,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: widget.onChange,
            keyboardType: TextInputType.text,
            controller: widget.controller,
            obscureText: _obsecureText,
            inputFormatters: widget.inputFormatters,
            textCapitalization: widget.textCapitalization,
            validator: widget.validate ??
                (value) {
                  if (!isValidPassword(password: value.toString())) {
                    return '- Password minimal 8 karakter\n' +
                        '- Diawali huruf kapital\n' +
                        '- Terdiri dari huruf besar, huruf kecil, angka dan symbol (!@#\$%^&*(),.?":{}|<>])';
                  }
                },
            style: TextStyles.mediumText1,
            decoration: inputDecoration(
                hintText: widget.hintText,
                prefixIcon: Icon(Icons.lock_outline_rounded),
                suffixIcon: InkWell(
                  child: _obsecureText
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility),
                  onTap: onTap,
                )),
          ),
        ],
      ),
    );
  }

  void onTap() {
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }
}
