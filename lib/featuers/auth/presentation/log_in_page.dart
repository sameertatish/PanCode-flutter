import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/core/general_export.dart';
import 'package:test_flutter/featuers/auth/bloc/auth_bloc.dart';
import 'package:test_flutter/featuers/auth/bloc/auth_event.dart';
import 'package:test_flutter/featuers/auth/bloc/auth_state.dart';
import 'package:test_flutter/featuers/auth/data/auth_api.dart';
import 'package:test_flutter/featuers/auth/data/model/log_in_body_model.dart';
import 'package:test_flutter/featuers/auth/presentation/widget/log_in_form_widget.dart';

@RoutePage(name: "LogInPageRoute")
class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(api: DioAuth()),
      child: const LogInView(),
    );
  }
}

class LogInView extends StatefulWidget {
  const LogInView({super.key});

  @override
  State<LogInView> createState() => LogInViewState();
}

class LogInViewState extends State<LogInView> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  logInBloc() {
    if (formKey.currentState?.validate() ?? false) {
      final bloc = BlocProvider.of<AuthBloc>(context);
      LogInBodyModel logInBodyModel = LogInBodyModel(
          username: username.text, password: password.text.trim());
      bloc.add(CheckLogin(logInBodyModel: logInBodyModel));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                appRouter.navigatorKey.currentContext?.popRoute();
              },
              child: const Icon(Icons.arrow_back)),
          centerTitle: true,
          title: const Text('Log In'),
        ),
        body: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 50.px),
            child: BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthLoadedState) {
                  AutoRouter.of(context)
                      .popAndPushAll([const AddHousePageRoute()]);
                }
                if (state is AuthFailureState) {
                  showToast(msg: state.message, isError: true);
                }
              },
              builder: (context, state) {
                if (state is AuthLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return LogInFormWidget(
                  logInViewState: this,
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    super.dispose();
  }
}
