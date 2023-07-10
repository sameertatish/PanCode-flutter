import 'package:image_picker/image_picker.dart';
import 'package:test_flutter/core/general_export.dart';
import 'package:test_flutter/featuers/home/data/model/house_model.dart';
import 'package:test_flutter/featuers/house/data/model/add_house_body_model.dart';
import 'package:test_flutter/featuers/house/data/model/add_house_model.dart';

class DioHouse {
  DioHouse()
      : _dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            connectTimeout: Endpoints.connectionTimeout,
            receiveTimeout: Endpoints.receiveTimeout,
            responseType: ResponseType.json,
          ),
        )..interceptors.addAll([
            LoggerInterceptor(),
            LanguageInterceptor(),
            HeaderInterceptor(),
            AuthorizationInterceptor()
          ]);

  late final Dio _dio;

  Future<AddHouseModel> addHouse(
      AddHouseBodyModel addHouseBodyModel, XFile? imageFile) async {
    try {
      FormData formData = FormData.fromMap({
        "name": addHouseBodyModel.name,
        'description': addHouseBodyModel.description,
        'price': addHouseBodyModel.price
      });
      if (imageFile != null) {
        formData.files.addAll([
          MapEntry("image", await MultipartFile.fromFile(imageFile.path)),
        ]);
      }
      var res = await _dio.post('api/house/add/', data: formData);
      return addHouseModelFromJson(res.toString());
    } on DioError catch (err) {
      throw err.response ?? '';
    }
  }

  Future<HouseModel> getAllHouse() async {
    try {
      var res = await _dio.get('api/house/get_all');
      return houseModelFromJson(res.toString());
    } on DioError catch (err) {
      String msg = "";
      msg = err.response?.data['message'] ?? "";
      String errorMessage =
          DioException.fromDioError(err, message: msg).toString();
      throw errorMessage;
    }
  }
}
