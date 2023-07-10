import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:test_flutter/core/common/common_wdget/bottom_picture.dart';
import '../../../core/general_export.dart';

class ContainerPicture extends StatelessWidget {
  final Function(XFile?) changeImage;
  final String imageNetwork;
  final XFile? imageFile;

  const ContainerPicture({
    Key? key,
    required this.changeImage,
    required this.imageNetwork,
    required this.imageFile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showPictureBottom(
          'Image House',
          changeImage: (img) {
            changeImage(img);
          },
        );
      },
      child: Container(
        height: Adaptive.px(165),
        decoration: BoxDecoration(
          color: grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(Adaptive.px(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: Adaptive.px(13)),
            Padding(
              padding: EdgeInsetsDirectional.only(
                start: Adaptive.px(24),
              ),
              child: Text(
                'Image',
                style: TextStyle(
                  color: Theme.of(context).hintColor,
                  fontSize: Adaptive.px(16),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const Spacer(),
            Row(
              children: [
                const Spacer(),
                if (imageFile != null) ...[
                  CircleAvatar(
                    radius: Adaptive.px(50),
                    backgroundImage: FileImage(File(imageFile!.path)),
                  ),
                ],
                if (imageFile == null && imageNetwork != "") ...[
                  CircleAvatar(
                    radius: Adaptive.px(50),
                    backgroundImage: NetworkImage(baseUrl + imageNetwork),
                  ),
                ],
                if (imageFile == null && imageNetwork == "") ...[
                  const Icon(Icons.camera)
                ],
                const Spacer(),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
