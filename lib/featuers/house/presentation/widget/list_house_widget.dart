import 'package:test_flutter/core/general_export.dart';
import 'package:test_flutter/featuers/home/data/model/house_model.dart';
import 'package:test_flutter/featuers/house/presentation/widget/house_item_widget.dart';

class ListHousesWidget extends StatefulWidget {
  final List<HouseData>? housesData;
  const ListHousesWidget({super.key, this.housesData});

  @override
  State<ListHousesWidget> createState() => _ListHousesWidgetState();
}

class _ListHousesWidgetState extends State<ListHousesWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 25.px),
      child: ListView.separated(
        itemCount: widget.housesData?.length ?? 0,
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: Adaptive.px(15),
          );
        },
        itemBuilder: (BuildContext context, int indexHouse) {
          return HouseContainerItem(
            housesData: widget.housesData?[indexHouse],
          );
        },
      ),
    );
  }
}
