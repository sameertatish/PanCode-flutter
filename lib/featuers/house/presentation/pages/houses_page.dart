// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:test_flutter/core/general_export.dart';
import 'package:test_flutter/featuers/house/bloc/house_bloc.dart';
import 'package:test_flutter/featuers/house/data/add_house_api.dart';
import 'package:test_flutter/featuers/house/presentation/widget/list_house_widget.dart';

import '../../bloc/house_event.dart';
import '../../bloc/house_state.dart';

@RoutePage(name: 'HousesPageRoute')
class HousesPage extends StatelessWidget {
  const HousesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HouseBloc(api: DioHouse())..add(GetAllHouse()),
      child: const HousesView(),
    );
  }
}

class HousesView extends StatefulWidget {
  const HousesView({super.key});

  @override
  State<HousesView> createState() => _HousesViewState();
}

class _HousesViewState extends State<HousesView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leading: InkWell(
                onTap: () {
                  AutoRouter.of(context).popAndPush(const HomeRoute());
                },
                child: const Icon(Icons.arrow_back)),
            centerTitle: true,
            title: const Text('Houses'),
          ),
          body: BlocConsumer<HouseBloc, HouseState>(
            listener: (context, state) {
              if (state is HouseFailureState) {
                showToast(msg: state.message, isError: true);
              }
              if (state is UnauthenticatedState) {
                AutoRouter.of(context).push(const LogInPageRoute());
              }
            },
            builder: (context, state) {
              if (state is HouseLoadingState) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: blue,
                ));
              }
              if (state is HouseLoadedState) {
                return ListHousesWidget(
                  housesData: state.houseModel.data,
                );
              }
              return const Center(
                  child: CircularProgressIndicator(
                color: blue,
              ));
            },
          )),
    );
  }
}
