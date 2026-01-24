import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shopzen/core/constants/api_constants.dart';
import 'package:shopzen/feature/auth/data/model/register/register_response_model.dart';

part 'auth_remote_data_source.g.dart';

@RestApi()
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String? baseUrl}) = _AuthApiService;

  @POST(EndPonts.register)
  Future<RegisterResponseModel> register({
      @Body() required Map<String, dynamic> body});
}

