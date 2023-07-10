import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_flutter/core/common/common_wdget/container_picture.dart';
import 'package:test_flutter/core/common/common_wdget/text_fied_profile.dart';
import 'package:test_flutter/core/general_export.dart';
import 'package:test_flutter/core/utils/validator.dart';
import 'package:test_flutter/featuers/house/bloc/house_bloc.dart';
import 'package:test_flutter/featuers/house/bloc/house_event.dart';
import 'package:test_flutter/featuers/house/bloc/house_state.dart';
import 'package:test_flutter/featuers/house/data/model/add_house_body_model.dart';

class AddHouseFormWidget extends StatefulWidget {
  const AddHouseFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<AddHouseFormWidget> createState() => _AddHouseFormWidgetState();
}

class _AddHouseFormWidgetState extends State<AddHouseFormWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  double marginH = 12.px;
  XFile? imageFile;
  String? imageNetwork;
  final formKey = GlobalKey<FormState>();

  addHouseBloc() {
    if (formKey.currentState?.validate() ?? false) {
      var bloc = BlocProvider.of<HouseBloc>(context);
      AddHouseBodyModel addHouseBodyModel = AddHouseBodyModel(
        name: nameController.text,
        description: descriptionController.text,
        price: priceController.text.trim(),
      );
      bloc.add(
          AddHouse(addHouseBodyModel: addHouseBodyModel, imageFile: imageFile));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: Adaptive.px(15),
          bottom: Adaptive.px(15),
          left: Adaptive.px(24),
          right: Adaptive.px(24)),
      child: Container(
        width: Adaptive.px(400),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: white),
        child: Padding(
          padding: EdgeInsets.all(Adaptive.px(16)),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  ContainerPicture(
                    imageFile: imageFile,
                    imageNetwork: '',
                    changeImage: (img) {
                      setState(() {
                        appRouter.navigatorKey.currentContext!.router.pop();
                        imageFile = img;
                      });
                    },
                  ),
                  SizedBox(
                    height: marginH,
                  ),
                  TextFieldProfile(
                    hintText: 'Name',
                    controller: nameController,
                    validator: Validator.emptyValidator,
                  ),
                  SizedBox(
                    height: marginH,
                  ),
                  TextFieldProfile(
                    hintText: 'description',
                    controller: descriptionController,
                    validator: Validator.emptyValidator,
                  ),
                  SizedBox(
                    height: marginH,
                  ),
                  TextFieldProfile(
                    hintText: 'price',
                    textInputType: TextInputType.number,
                    controller: priceController,
                    validator: Validator.emptyValidator,
                  ),
                  SizedBox(
                    height: marginH,
                  ),
                  BlocConsumer<HouseBloc, HouseState>(
                    listener: (context, state) {
                      if (state is HouseFailureState) {
                        showToast(msg: state.message, isError: true);
                      }
                      if (state is UnauthenticatedState) {
                        AutoRouter.of(context).push(const LogInPageRoute());
                      }

                      if (state is AddHouseLoadedState) {
                        showToast(
                            msg: state.houseModel.message ?? '',
                            isError: false);
                        appRouter.navigatorKey.currentContext?.popRoute();
                      }
                    },
                    builder: (context, state) {
                      if (state is HouseLoadingState) {
                        return const CircularProgressIndicator(
                          color: white,
                        );
                      }
                      return InkWell(
                        onTap: () {
                          addHouseBloc();
                        },
                        child: Container(
                          width: Adaptive.px(100),
                          height: Adaptive.px(40),
                          decoration: const BoxDecoration(
                              color: blue,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: const Center(
                              child: Text(
                            'SAVE',
                            style: TextStyle(color: white),
                          )),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    super.dispose();
  }
}
