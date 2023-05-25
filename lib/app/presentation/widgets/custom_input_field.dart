import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:mi_app/app/presentation/helpers/tipo_input.dart';
import 'package:mi_app/app/presentation/helpers/preferences.dart';
import 'package:mi_app/app/presentation/theme/app_theme.dart';

class CustomInputField extends StatefulWidget {
  final TipoInput? tipoInput;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final IconData? icon;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final bool obscureText;
  final bool autocorrect;

  final String formProperty;
  final Map<String, dynamic> formValues;
  final String? Function(String?)? validator;
  final String? fondoOscuro;

  const CustomInputField({
    Key? key,
    this.hintText,
    this.labelText,
    this.helperText,
    this.icon,
    this.suffixIcon,
    this.keyboardType,
    this.obscureText = false,
    required this.formProperty,
    required this.formValues,
    this.autocorrect = true,
    this.prefixIcon,
    this.validator,
    this.textCapitalization = TextCapitalization.none,
    this.tipoInput = TipoInput.textFormField,
    this.fondoOscuro = "",
  }) : super(key: key);

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.tipoInput) {
      case TipoInput.dropdownButtonFormField:
        return DropdownButtonFormField(
          dropdownColor: Preferences.isDarkmode ? Colors.white : null,
          decoration: const InputDecoration(
            filled: true,
            fillColor: Colors.white,
          ),
          hint: Text(
            "Seleccione un Rol",
            style: Preferences.isDarkmode
                ? const TextStyle(color: Colors.black)
                : null,
          ),
          items: [
            DropdownMenuItem(
                value: 'SUPERADMIN_ROLE',
                child: Text(
                  'SUPERADMIN_ROLE',
                  style: TextStyle(
                      color: Preferences.isDarkmode ? Colors.black : null),
                )),
            DropdownMenuItem(
                value: 'ADMIN_ROLE',
                child: Text(
                  'ADMIN_ROLE',
                  style: TextStyle(
                      color: Preferences.isDarkmode ? Colors.black : null),
                )),
            DropdownMenuItem(
                value: 'USER_ROLE',
                child: Text(
                  'USER_ROLE',
                  style: TextStyle(
                      color: Preferences.isDarkmode ? Colors.black : null),
                )),
            DropdownMenuItem(
                value: 'GUEST_ROLE',
                child: Text(
                  'GUEST_ROLE',
                  style: TextStyle(
                      color: Preferences.isDarkmode ? Colors.black : null),
                )),
          ],
          onChanged: (value) => widget.formValues[widget.formProperty] = value,
          validator: widget.validator,
        );
      default:
        return TextFormField(
          style: const TextStyle(color: Colors.black),
          initialValue: widget.formValues[widget.formProperty],
          textCapitalization: widget.textCapitalization,
          autocorrect: widget.autocorrect,
          keyboardType: widget.keyboardType,
          obscureText: _obscureText,
          onChanged: (value) => widget.formValues[widget.formProperty] = value,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: widget.validator,
          decoration: InputDecoration(
              errorStyle: Preferences.isDarkmode
                  ? const TextStyle(color: Colors.yellow)
                  : TextStyle(
                      color: widget.fondoOscuro == "si" ? Colors.white : null),
              filled: true,
              fillColor: Colors.white,
              hintText: widget.hintText,
              hintStyle: Preferences.isDarkmode
                  ? const TextStyle(color: Colors.black54)
                  : null,
              labelText: widget.labelText,
              labelStyle: Preferences.isDarkmode
                  ? const TextStyle(color: Colors.black)
                  : null,
              helperText: widget.helperText,
              suffixIcon: widget.suffixIcon == null
                  ? null
                  : widget.obscureText
                      ? CupertinoButton(
                          onPressed: () {
                            _obscureText = !_obscureText;
                            setState(() {});
                          },
                          child: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Preferences.isDarkmode
                                ? Colors.black54
                                : Apptheme.primary,
                          ),
                        )
                      : Icon(widget.suffixIcon),
              prefixIcon:
                  widget.prefixIcon == null ? null : Icon(widget.prefixIcon),
              icon: widget.icon == null ? null : Icon(widget.icon)),
        );
    }
  }
}
