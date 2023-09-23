import 'package:robo_controller/domain/posts/models/post_entity.dart';

abstract interface class PostRepository {
  Future<Iterable<PostEntity>> getPosts();
}
