import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/general_export.dart';
import 'package:intl/intl.dart' as intl;

class TextFieldProfile extends StatefulWidget {
  final String hintText;
  final String? labelText;
  final bool isSecure;
  final bool? isFill;
  final bool? isExbanded;
  final TextEditingController controller;
  final int maxLine;
  final Widget? suffixIcon;
  final TextInputType textInputType;
  final Function? onEditingCompleteFunc;
  final bool? autoFocus;
  final String? Function(String? value)? validator;
  final void Function(String)? onChanged;
  final bool isCurrentDate;
  const TextFieldProfile({
    Key? key,
    required this.hintText,
    this.labelText,
    required this.controller,
    this.textInputType = TextInputType.text,
    this.isSecure = false,
    this.maxLine = 1,
    this.suffixIcon,
    this.isExbanded,
    this.isFill,
    this.autoFocus,
    this.onEditingCompleteFunc,
    this.validator,
    this.onChanged,
    this.isCurrentDate = false,
  }) : super(key: key);

  @override
  State<TextFieldProfile> createState() => _TextFieldProfileState();
}

class _TextFieldProfileState extends State<TextFieldProfile>
    with WidgetsBindingObserver {
  bool isSecure = false;
  String text = '';
  bool isRTL(String text) {
    return intl.Bidi.detectRtlDirectionality(text);
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    setState(() {
      isSecure = widget.isSecure;
    });
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
    FocusScopeNode currentFocus =
        FocusScope.of(appRouter.navigatorKey.currentContext!);

    if (state == AppLifecycleState.inactive) {
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
    }
    if (state == AppLifecycleState.resumed) {
      currentFocus.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: widget.autoFocus ?? false,
      autovalidateMode: AutovalidateMode.onUserInteraction,

      onChanged: (value) {
        text = value;
        widget.onChanged?.call(value);
      },
      validator: (value) {
        return widget.validator?.call(value?.trim());
      },
      expands: widget.isExbanded ?? false,
      textDirection: isRTL(text) ? TextDirection.rtl : TextDirection.ltr,
      controller: widget.controller,
      obscureText: isSecure,
      maxLines: widget.maxLine,
      keyboardType: widget.textInputType,
      onEditingComplete: () {
        if (widget.onEditingCompleteFunc != null) {
          widget.onEditingCompleteFunc!();
        }
      },
      readOnly: widget.textInputType == TextInputType.datetime,
      onTap: () async {
        if (widget.controller.selection ==
            TextSelection.fromPosition(
                TextPosition(offset: widget.controller.text.length - 1))) {
          setState(() {
            widget.controller.selection = TextSelection.fromPosition(
                TextPosition(offset: widget.controller.text.length));
          });
        }

        if (widget.textInputType == TextInputType.datetime &&
            !(widget.isCurrentDate)) {
          await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2015),
            lastDate: DateTime(2025),
          ).then((selectedDate) {
            if (selectedDate != null) {
              widget.controller.text =
                  easy.DateFormat('yyyy-MM-dd').format(selectedDate);
            }
          });
        }
      },
      mouseCursor: MouseCursor.uncontrolled,
      //todo ask lana if there is no problem
      onFieldSubmitted: (newValue) {
        FocusScope.of(context).nextFocus();
      },

      decoration: InputDecoration(
        labelText: widget.labelText != null ? widget.labelText : null,
        errorMaxLines: 3,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.red),
        ),
        errorStyle: TextStyle(color: Colors.red, fontSize: Adaptive.px(14)),
        filled: widget.isFill ?? true,
        fillColor: Theme.of(context).inputDecorationTheme.fillColor,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: Theme.of(context).hintColor,
          fontWeight: FontWeight.w400,
          fontSize: Adaptive.px(18),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: Adaptive.px(24),
          vertical: Adaptive.px(15),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        suffixIcon: widget.isSecure
            ? InkWell(
                onTap: () {
                  setState(() {
                    isSecure = !isSecure;
                  });
                },
                child: Icon(
                    isSecure ? CupertinoIcons.eye_slash : Icons.remove_red_eye,
                    color: orange),
              )
            : widget.suffixIcon,
      ),
    );
  }
}
