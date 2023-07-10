import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/core/general_export.dart';
import 'package:test_flutter/featuers/home/bloc/dashbaord_bloc.dart';
import 'package:test_flutter/featuers/home/bloc/dashbaord_event.dart';
import 'package:test_flutter/featuers/home/data/dashboard_api.dart';
import 'package:test_flutter/featuers/home/presentation/widget/continer_details_widget.dart';
import 'package:test_flutter/featuers/home/presentation/widget/fab_widget.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DashbaordBloc(api: DioDashboard())..add(GetDashboardDetails()),
      child: const HomePageView(),
    );
  }
}

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: const FabWidget(),
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                AutoRouter.of(context).push(const LogInPageRoute());
              },
              child: const Icon(Icons.login)),
          centerTitle: true,
          title: const Text('Dashboard'),
        ),
        body: const Center(child: ContainerDashboardDetials()),
      ),
    );
  }
}
