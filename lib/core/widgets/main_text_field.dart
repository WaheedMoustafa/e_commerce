import 'package:flutter/material.dart';

import '../utils/color_app.dart';
import '../utils/images_app.dart';

class BuildTextField extends StatefulWidget {
  const BuildTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.nextFocus,
    this.label,
    this.hint,
    this.isObscured = false,
    this.iconData,
    this.textInputType = TextInputType.text,
    this.backgroundColor,
    this.hintTextStyle,
    this.labelTextStyle,
    this.cursorColor,
    this.readOnly = false,
    this.validation,
    this.onTap,
    this.maxLines,
    this.prefixIcon, this.borderBackgroundColor, this.suffixIcon,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final bool isObscured;
  final String? label;
  final String? hint;
  final TextInputType textInputType;
  final IconData? iconData;
  final Color? backgroundColor;
  final Color? borderBackgroundColor;
  final TextStyle? hintTextStyle;
  final TextStyle? labelTextStyle;
  final Color? cursorColor;
  final bool readOnly;
  final int? maxLines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validation;
  final void Function()? onTap;

  @override
  State<BuildTextField> createState() => _BuildTextFieldState();
}

class _BuildTextFieldState extends State<BuildTextField> {
  late bool hidden = widget.isObscured;
  String? errorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.label != null
            ? Padding(
                padding: const EdgeInsets.only(
                     top: 2),
                child: Text(
                  widget.label!,
                  style: widget.labelTextStyle ??
                      const TextStyle(color: AppColor.white,fontSize: 18),
                ),
              )
            : const SizedBox(),
        Container(
          margin: const EdgeInsets.only(top: 5),
          decoration: BoxDecoration(
            color: widget.backgroundColor ??
                AppColor.black.withOpacity(.15),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: widget.borderBackgroundColor ?? Colors.transparent)
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: TextFormField(
            maxLines: widget.maxLines ?? 1,
            controller: widget.controller,
            focusNode: widget.focusNode,
            readOnly: widget.readOnly,
            style: const TextStyle(color: AppColor.black,fontSize: 18),
            obscureText: hidden,
            keyboardType: widget.textInputType,
            obscuringCharacter: '*',
            cursorColor: widget.cursorColor ?? AppColor.black,
            onTap: widget.onTap,
            onEditingComplete: () {
              widget.focusNode?.unfocus();
              if (widget.nextFocus != null) {
                FocusScope.of(context).requestFocus(widget.nextFocus);
              }
            },
            textInputAction: widget.nextFocus == null
                ? TextInputAction.done
                : TextInputAction.next,
            validator: (value) {
              if (widget.validation == null) {
                setState(() {
                  errorText = null;
                });
              } else {
                setState(() {
                  errorText = widget.validation!(value);
                });
              }
              return errorText;
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(12),
              hintText: widget.hint,
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.isObscured
                  ? IconButton(
                      onPressed: () {
                        setState(
                          () {
                            hidden = !hidden;
                          },
                        );
                      },
                      iconSize: 24,
                      splashRadius: 1,
                      isSelected: !hidden,
                      color: widget.cursorColor,
                      selectedIcon: const Icon(Icons.remove_red_eye_rounded),
                      icon: Image.asset(AppImages.eye),
                    )
                  : widget.suffixIcon,
              hintStyle: widget.hintTextStyle ??
                  const TextStyle(color: Colors.grey,fontSize: 18),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorStyle: const TextStyle(
                fontSize: 0,
                color: Colors.transparent,
              ),
            ),
          ),
        ),
        errorText == null
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                  left: 8,
                ),
                child: Text(
                  errorText!,
                  style: const TextStyle(color: AppColor.white,fontSize: 18),
                ),
              ),
      ],
    );
  }
}
