import 'package:injectable/injectable.dart';
import 'package:robo_controller/core/domain/models/result.dart';
import 'package:robo_controller/domain/posts/models/post_entity.dart';
import 'package:robo_controller/domain/posts/repositories/post_repository.dart';

abstract interface class GetPostsUseCase {
  Future<Result<Iterable<PostEntity>>> getAll();
}

@LazySingleton(as: GetPostsUseCase)
class GetPostsUseCaseImpl implements GetPostsUseCase {
  final PostRepository _postRepository;

  const GetPostsUseCaseImpl(this._postRepository);

  @override
  Future<Result<Iterable<PostEntity>>> getAll() async {
    try {
      final Iterable<PostEntity> posts = await _postRepository.getPosts();

      return Success<Iterable<PostEntity>>(posts);
    } catch (e, st) {
      return Failure<Iterable<PostEntity>>(Exception(e), st);
    }
  }
}
