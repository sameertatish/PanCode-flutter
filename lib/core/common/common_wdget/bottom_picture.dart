import 'package:image_picker/image_picker.dart';
import '../../../core/general_export.dart';

showPictureBottom(String title, {required Function(XFile?) changeImage}) {
  showModalBottomSheet(
      isScrollControlled: true,
      context: appRouter.navigatorKey.currentContext!,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      builder: (context) {
        return Padding(
          padding:
              MediaQuery.of(appRouter.navigatorKey.currentContext!).viewInsets,
          child: Container(
            height: Adaptive.px(260),
            padding: EdgeInsets.symmetric(horizontal: Adaptive.px(24)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: Adaptive.px(24)),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: Adaptive.px(8)),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Theme.of(context).hintColor,
                      fontSize: Adaptive.px(17),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(height: Adaptive.px(24)),
                containerSelectorPicture(
                    true, appRouter.navigatorKey.currentContext!,
                    changeImage: changeImage),
                SizedBox(height: Adaptive.px(12)),
                containerSelectorPicture(
                    false, appRouter.navigatorKey.currentContext!,
                    changeImage: changeImage),
                SizedBox(height: Adaptive.px(24)),
              ],
            ),
          ),
        );
      });
}

Widget containerSelectorPicture(bool isCamera, BuildContext context,
    {required Function(XFile?) changeImage}) {
  return InkWell(
    onTap: () async {
      final ImagePicker picker = ImagePicker();
      try {
        XFile? image = await picker.pickImage(
          source: isCamera ? ImageSource.camera : ImageSource.gallery,
        );
        changeImage(image);
      } catch (e) {}
    },
    child: Container(
      padding: EdgeInsets.all(Adaptive.px(20)),
      decoration: BoxDecoration(
        color: Theme.of(context).inputDecorationTheme.fillColor,
        borderRadius: BorderRadius.circular(Adaptive.px(10)),
      ),
      child: Row(
        children: [
          isCamera ? const Icon(Icons.camera) : const Icon(Icons.image),
          SizedBox(width: Adaptive.px(12)),
          Text(
            isCamera ? 'camera' : 'gallery',
            style: TextStyle(
              color: Theme.of(context).hintColor,
              fontWeight: FontWeight.w400,
              fontSize: Adaptive.px(18),
            ),
          )
        ],
      ),
    ),
  );
}
