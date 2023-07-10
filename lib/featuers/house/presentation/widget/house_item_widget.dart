import 'package:test_flutter/core/general_export.dart';
import 'package:test_flutter/featuers/home/data/model/house_model.dart';
import 'package:test_flutter/featuers/house/presentation/widget/list_markter_widget.dart';

class HouseContainerItem extends StatelessWidget {
  final HouseData? housesData;
  const HouseContainerItem({super.key, required this.housesData});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Adaptive.px(230),
      margin: EdgeInsets.symmetric(horizontal: 20.px),
      padding: EdgeInsets.symmetric(horizontal: 20.px),
      decoration: const BoxDecoration(
          color: lightGrey,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: Adaptive.px(10),
          ),
          Center(
            child: Icon(
              Icons.home,
              color: blue,
              size: Adaptive.px(50),
            ),
          ),
          Text('title: ${housesData?.name ?? ''}'),
          SizedBox(
            height: Adaptive.px(10),
          ),
          Text('description: ${housesData?.description ?? ''}'),
          SizedBox(
            height: Adaptive.px(10),
          ),
          Text('price: ${housesData?.price.toString() ?? ''}'),
          SizedBox(
            height: Adaptive.px(10),
          ),
          const Text(
            'Marketers:',
            style: TextStyle(
              color: blue,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(
            height: Adaptive.px(10),
          ),
          MarketListInHouse(marketer: housesData?.marketer ?? []),
        ],
      ),
    );
  }
}
