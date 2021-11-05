import 'package:flutter/widgets.dart';
import 'package:flutter_ui_lafyu_e_commerce/app/data/theme/colors.dart';
import 'package:flutter_ui_lafyu_e_commerce/app/data/theme/theme.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormEmail extends StatefulWidget {
  final String hintText;
  final String? Function(String?)? validate;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String label;
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final Function(bool) isValid;
  final Function(String) email;
  final String? Function(String?)? onChange;

  const FormEmail({
    Key? key,
    this.hintText = '',
    this.validate,
    this.onChange,
    this.prefixIcon,
    this.suffixIcon,
    this.label = '',
    required this.controller,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.none,
    required this.isValid,
    required this.email,
  }) : super(key: key);

  @override
  _FormEmailState createState() => _FormEmailState();
}

class _FormEmailState extends State<FormEmail> {
  bool _emailValid = false;
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
            inputFormatters: widget.inputFormatters,
            textCapitalization: widget.textCapitalization,
            validator: widget.validate ??
                (value) {
                  if (!GetUtils.isEmail(value.toString())) {
                    widget.isValid(false);
                    widget.email('');
                    onValid(false);
                    return ' Oops! Your Email Is Not Correct ';
                  }
                  onValid(true);
                  widget.email(value.toString());
                  widget.isValid(true);
                  return null;
                },
            style: TextStyles.mediumText1,
            decoration: inputDecoration(
                hintText: widget.hintText,
                prefixIcon: Icon(
                  Icons.email_outlined,
                ),
                suffixIcon: widget.suffixIcon ??
                    Icon(
                      Icons.email_outlined,
                      color: Colors.transparent,
                    )),
          ),
        ],
      ),
    );
  }

  void onValid(bool val) {
    _emailValid = val;
  }
}
