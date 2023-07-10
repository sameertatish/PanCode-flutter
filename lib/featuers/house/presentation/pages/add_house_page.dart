import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/core/general_export.dart';
import 'package:test_flutter/featuers/house/bloc/house_bloc.dart';
import 'package:test_flutter/featuers/house/data/add_house_api.dart';
import 'package:test_flutter/featuers/house/presentation/widget/add_house_form_widget.dart';

@RoutePage(name: 'AddHousePageRoute')
class AddHousePage extends StatefulWidget {
  const AddHousePage({super.key});

  @override
  State<AddHousePage> createState() => _AddHousePageState();
}

class _AddHousePageState extends State<AddHousePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HouseBloc(api: DioHouse()),
      child: const AddHouseView(),
    );
  }
}

class AddHouseView extends StatefulWidget {
  const AddHouseView({super.key});

  @override
  State<AddHouseView> createState() => _AddHouseViewState();
}

class _AddHouseViewState extends State<AddHouseView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                AutoRouter.of(context).popAndPush(const HousesPageRoute());
              },
              child: const Icon(Icons.arrow_back)),
          centerTitle: true,
          title: const Text('Add House'),
        ),
        body: const AddHouseFormWidget(),
      ),
    );
  }
}
