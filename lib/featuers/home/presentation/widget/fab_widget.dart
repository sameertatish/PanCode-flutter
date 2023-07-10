import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:test_flutter/core/general_export.dart';

class FabWidget extends StatefulWidget {
  const FabWidget({Key? key}) : super(key: key);

  @override
  State<FabWidget> createState() => _FabWidgetState();
}

class _FabWidgetState extends State<FabWidget> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ScaleTransition(
            scale: CurvedAnimation(
              parent: _controller,
              curve: const Interval(
                0.0,
                1.0 - 0 / 2 / 2.0,
                curve: Curves.easeOut,
              ),
            ),
            child: SizedBox(
              width: Adaptive.px(100),
              height: Adaptive.px(100),
              child: FloatingActionButton.large(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Adaptive.px(5)),
                ),
                backgroundColor: blue,
                onPressed: null,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () async {
                        await _controller.reverse();
                        appRouter.navigatorKey.currentContext!.router
                            .push(const AddHousePageRoute());
                      },
                      child: Row(
                        children: [
                          SizedBox(width: Adaptive.px(8)),
                          const Text(
                            'Add house',
                            style: TextStyle(color: white),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: Adaptive.px(16)),
                    InkWell(
                      onTap: () async {
                        await _controller.reverse();
                        appRouter.navigatorKey.currentContext!.router
                            .push(const HousesPageRoute());
                      },
                      child: Row(
                        children: [
                          SizedBox(width: Adaptive.px(8)),
                          const Text(
                            'houses',
                            style: TextStyle(color: white),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: Adaptive.px(16)),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: Adaptive.px(8)),
          FloatingActionButton(
            clipBehavior: Clip.antiAlias,
            heroTag: null,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget? child) {
                return Transform(
                  transform: Matrix4.rotationZ(
                    _controller.value * (math.pi),
                  ),
                  alignment: FractionalOffset.center,
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: blue),
                    child: Icon(
                      _controller.isDismissed ? Icons.add : Icons.close,
                      color: white,
                    ),
                  ),
                );
              },
            ),
            onPressed: () {
              if (_controller.isDismissed) {
                _controller.forward();
              } else {
                _controller.reverse();
              }
            },
          ),
        ]);
  }
}
