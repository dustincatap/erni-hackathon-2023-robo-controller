// coverage:ignore-file

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:robo_controller/core/data/api/dio_provider.dart';
import 'package:robo_controller/domain/posts/models/post_data_contract.dart';

part 'post_api.g.dart';

@lazySingleton
@RestApi()
abstract interface class PostApi {
  @factoryMethod
  factory PostApi(DioProvider dioProvider) => _PostApi(dioProvider.create<PostApi>());

  @GET('/posts')
  Future<List<PostDataContract>> getPosts();
}
