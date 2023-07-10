import 'package:test_flutter/core/common/common_wdget/text_fied_profile.dart';
import 'package:test_flutter/core/general_export.dart';
import 'package:test_flutter/core/utils/validator.dart';
import 'package:test_flutter/featuers/auth/presentation/log_in_page.dart';

class LogInFormWidget extends StatefulWidget {
  final LogInViewState logInViewState;
  const LogInFormWidget({super.key, required this.logInViewState});

  @override
  State<LogInFormWidget> createState() => _LogInFormWidgetState();
}

class _LogInFormWidgetState extends State<LogInFormWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextFieldProfile(
          hintText: 'user name',
          controller: widget.logInViewState.username,
          validator: Validator.emptyValidator,
        ),
        SizedBox(
          height: 25.px,
        ),
        TextFieldProfile(
          hintText: 'password',
          isSecure: true,
          controller: widget.logInViewState.password,
          validator: Validator.emptyValidator,
        ),
        SizedBox(
          height: 25.px,
        ),
        InkWell(
          onTap: () {
            widget.logInViewState.logInBloc();
          },
          child: Container(
            width: Adaptive.px(150),
            height: Adaptive.px(40),
            decoration: const BoxDecoration(
                color: blue,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: const Center(
                child: Text(
              'Log In',
              style: TextStyle(color: white),
            )),
          ),
        )
      ],
    );
  }
}
