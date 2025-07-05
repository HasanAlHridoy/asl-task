import 'package:asl_task/src/core/config/size/size.dart';
import 'package:asl_task/src/core/utils/extensions/context.dart';
import 'package:asl_task/src/core/utils/extensions/double.dart';
import 'package:asl_task/src/core/utils/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomTextFiledWithLabel extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final String? hintText;
  final bool? readOnly;
  final bool? obscureText;
  final int? maxLines;
  final String? isRequired;
  final VoidCallback? onTap;
  final Widget? trailing;
  final TextInputType? keyboardType;
  final Iterable<String>? autofillHints;
  final String? Function(String?)? validator;
  const CustomTextFiledWithLabel({
    super.key,
    required this.label,
    this.hintText,
    this.keyboardType,
    this.isRequired,
    this.readOnly,
    this.onTap,
    this.trailing,
    required this.controller,
    this.validator,
    this.obscureText,
    this.autofillHints,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(label, style: context.text.bodyMedium),
            Text(isRequired ?? '', style: context.text.bodyMedium!.copyWith(color: errorColor)),
          ],
        ),

        (defaultPadding / 2).height,
        TextFormField(
          onTap: onTap,
          controller: controller,
          maxLines: maxLines ?? 1,
          style: context.text.bodyMedium!,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: context.text.bodyMedium!.copyWith(color: context.theme.dividerColor),
            suffixIcon: trailing,
          ),
          readOnly: readOnly ?? false,
          textInputAction: TextInputAction.next,
          keyboardType: keyboardType ?? TextInputType.text,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: obscureText ?? false,
          autofillHints: autofillHints,
          validator:
              validator ??
              (v) {
                if (v == null || v.isEmpty) {
                  return '$label is required';
                }
                return null;
              },
          onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
        ),
      ],
    );
  }
}
