import 'package:test_flutter/core/general_export.dart';
import 'package:test_flutter/featuers/home/data/model/house_model.dart';

class MarketListInHouse extends StatelessWidget {
  final List<Marketer> marketer;
  const MarketListInHouse({
    Key? key,
    required this.marketer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: Adaptive.px(100)),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: marketer.length,
        separatorBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '-----',
                style: TextStyle(
                  color: blue,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(
                height: Adaptive.px(10),
              ),
            ],
          );
        },
        itemBuilder: (BuildContext context, int indexMarkter) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(marketer[indexMarkter].name ?? ''),
              SizedBox(
                height: Adaptive.px(10),
              ),
              Text(marketer[indexMarkter].gender ?? ''),
              SizedBox(
                height: Adaptive.px(10),
              ),
              Text(marketer[indexMarkter].minBalance?.toString() ?? ""),
              SizedBox(
                height: Adaptive.px(10),
              ),
              Text(marketer[indexMarkter].percentage?.toString() ?? ""),
              SizedBox(
                height: Adaptive.px(10),
              ),
            ],
          );
        },
      ),
    );
  }
}
