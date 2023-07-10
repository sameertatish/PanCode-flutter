import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/core/general_export.dart';
import 'package:test_flutter/featuers/home/bloc/dashbaord_bloc.dart';
import 'package:test_flutter/featuers/home/bloc/dashbaord_state.dart';

class ContainerDashboardDetials extends StatefulWidget {
  const ContainerDashboardDetials({super.key});

  @override
  State<ContainerDashboardDetials> createState() =>
      _ContainerDashboardDetialsState();
}

class _ContainerDashboardDetialsState extends State<ContainerDashboardDetials> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocConsumer<DashbaordBloc, DashbaordState>(
          listener: (context, state) {
            if (state is DashbaordFailureState) {
              showToast(msg: state.message, isError: true);
            }
            if (state is UnauthenticatedState) {
              AutoRouter.of(context).push(const LogInPageRoute());
            }
          },
          builder: (context, state) {
            if (state is DashbaordLoadedState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ContainerCard(
                    title:
                        'Purchased Houses: ${state.houseModel.numberPurchasedHouse.toString()}',
                  ),
                  SizedBox(
                    height: Adaptive.px(24),
                  ),
                  SizedBox(
                    height: 500,
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: state.houseModel.data?.length ?? 0,
                      separatorBuilder: (BuildContext context, int i) {
                        return SizedBox(
                          height: 10.px,
                        );
                      },
                      itemBuilder: (BuildContext context, int i) {
                        return Container(
                          width: Adaptive.px(230),
                          margin: EdgeInsets.symmetric(horizontal: 20.px),
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.px,
                            vertical: 20.px,
                          ),
                          decoration: const BoxDecoration(
                              color: lightGrey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(state.houseModel.data?[i].name ?? ""),
                              Text(state.houseModel.data?[i].minBalance
                                      .toString() ??
                                  ""),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }
            return const CircularProgressIndicator();
          },
        )
      ],
    );
  }
}

class ContainerCard extends StatelessWidget {
  final String title;
  const ContainerCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.px),
      decoration: const BoxDecoration(
          color: blue, borderRadius: BorderRadius.all(Radius.circular(10))),
      height: Adaptive.px(75),
      child: Center(
          child: Text(
        title,
        style: const TextStyle(color: white),
      )),
    );
  }
}
