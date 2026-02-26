import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shopzen/core/notworking/endpoints.dart';
import 'package:shopzen/feature/home/data/model/category/category_response_model.dart';

part 'home_remote_data_sources.g.dart';

@RestApi()
abstract class HomeApiService {
  factory HomeApiService(Dio dio, {String? baseUrl}) = _HomeApiService;

  @GET(Endpoints.categories)
  Future<CategoryResponseModel> getCategories();
}
