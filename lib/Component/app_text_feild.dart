import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    Key? key,
    this.onTab,
    this.controller,
    this.suffixIcon,
    this.prefixIcon,
    this.label,
    this.readOnly = false, required String? Function(dynamic value) validator,
  }) : super(key: key);
  final VoidCallback? onTab;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Widget? label;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTab,
      controller: controller,
      readOnly: readOnly,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        label: label,
      ),
    );
  }
}
