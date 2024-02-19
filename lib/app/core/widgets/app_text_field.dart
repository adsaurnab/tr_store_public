import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_style.dart';
import 'app_widgets.dart';

class AppTextField extends StatefulWidget {
  final String title, hintText;
  final String? validatorMSG;
  final TextEditingController controller;
  final bool needTopSpace,
      isPassword,
      isTextBlack,
      needTitle,
      needPrefixIcon,
      isFilePicker,
      isRequired,
      isPhoneNumber,
      isReadonly,
      isNumberKeyboard,
      enabled;

  final dynamic clickListener;

  final String? Function(String?)? validator;
  final Color textColor, fillColor;
  final double textFieldBorderRadius;
  final int maxLine;

  const AppTextField(
    this.title, {
    super.key,
    required this.controller,
    this.validator,
    this.clickListener,
    this.validatorMSG,
    this.hintText = "",
    this.needTopSpace = true,
    this.needTitle = true,
    this.enabled = true,
    this.isRequired = true,
    this.isFilePicker = false,
    this.isReadonly = false,
        this.isPhoneNumber = false,
        this.isNumberKeyboard = false,
        this.isPassword = false,
        this.needPrefixIcon = false,
        this.textColor = AppColors.primaryColor,
        this.fillColor = AppColors.whitePure,
        this.isTextBlack = false,
        this.textFieldBorderRadius = 8.0,
        this.maxLine = 1,
      });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    isVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: widget.title != "",
          child: gapH16(),
        ),
        widget.title != ""
            ? Text(
                "${widget.title} ${widget.isRequired ? "*" : ""}",
                style: headerTextStyle(
                  color:
                      widget.isTextBlack ? AppColors.black : widget.textColor,
                  letterSpacing: .1,
                  fontWeight: FontWeight.w600,
                ),
              )
            : Container(),
        widget.title != "" ? gapH12() : Container(),
        TextFormField(
          onTap: () {
            widget.clickListener != null
                ? widget.clickListener(widget.controller)
                : null;
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: widget.controller,
          keyboardType: widget.isPhoneNumber
              ? TextInputType.phone
              : widget.isNumberKeyboard
                  ? TextInputType.number
                  : TextInputType.text,
          readOnly: widget.isReadonly,
          validator: (value) {
            if (!widget.isRequired) {
              return null;
            }
            if (value == null || value == "") {
              return "Enter a value";
            } else if (widget.validatorMSG != "") {
              return widget.validatorMSG;
            }

            return null;
          },
          obscureText: widget.isPassword ? (isVisible ? false : true) : false,
          maxLines: widget.maxLine,
          scrollPadding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          onChanged: (value) {},
          decoration: InputDecoration(
            enabled: widget.enabled,
            hintText: widget.hintText,
            hintStyle: normalTextStyle(
              fontSize: 16,
              color: AppColors.grey.withOpacity(.5),
              lineHeight: 1.3,
            ),
            fillColor: widget.fillColor,
            filled: true,
            disabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: AppColors.grey.withOpacity(.2), width: 1.0),
              borderRadius: BorderRadius.circular(widget.textFieldBorderRadius),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: AppColors.grey.withOpacity(.2), width: 1.0),
              borderRadius: BorderRadius.circular(widget.textFieldBorderRadius),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: AppColors.grey.withOpacity(.2), width: 1.0),
              borderRadius: BorderRadius.circular(widget.textFieldBorderRadius),
            ),
            contentPadding: const EdgeInsets.all(12),
            prefixIcon: widget.needPrefixIcon ? const Icon(Icons.search) : null,
            suffixIcon: widget.isPassword
                ? isVisible
                    ? InkWell(
                        onTap: () {
                          setState(
                            () {
                              isVisible = !isVisible;
                            },
                          );
                        },
                        child: const Icon(Icons.visibility),
                      )
                    : InkWell(
                        onTap: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                        child: const Icon(Icons.visibility_off),
                      )
                : null,
          ),
        ),
      ],
    );
  }
}
