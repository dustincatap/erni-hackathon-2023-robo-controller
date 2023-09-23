import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:robo_controller/common/localization/generated/l10n.dart';
import 'package:robo_controller/core/domain/models/result.dart';
import 'package:robo_controller/core/infrastructure/logging/logger.dart';
import 'package:robo_controller/core/presentation/navigation/navigation_service.dart';
import 'package:robo_controller/core/presentation/navigation/root_auto_router.gr.dart';
import 'package:robo_controller/core/presentation/view_models/initializable.dart';
import 'package:robo_controller/core/presentation/view_models/view_model.dart';
import 'package:robo_controller/domain/posts/models/post_entity.dart';
import 'package:robo_controller/domain/posts/models/posts_list_state.dart';
import 'package:robo_controller/domain/posts/use_cases/get_posts_use_case.dart';

@injectable
class PostsViewModel extends ViewModel implements Initializable {
  final Logger _logger;
  final NavigationService _navigationService;
  final GetPostsUseCase _getPostsUseCase;

  final ValueNotifier<PostsListState> _postsState = ValueNotifier<PostsListState>(const PostsListLoadingState());

  PostsViewModel(this._logger, this._navigationService, this._getPostsUseCase) {
    _logger.logFor(this);
  }

  ValueListenable<PostsListState> get postsState => _postsState;

  @override
  Future<void> onInitialize() async {
    await _onGetPosts();
  }

  Future<void> onPostSelected(PostEntity post) async {
    await _navigationService.push(PostDetailsViewRoute(post: post));
  }

  Future<void> _onGetPosts() async {
    _logger.log(LogLevel.info, 'Getting posts');
    _postsState.value = const PostsListLoadingState();

    final Result<Iterable<PostEntity>> getPostsResult = await _getPostsUseCase.getAll();

    switch (getPostsResult) {
      case Success<Iterable<PostEntity>>(:final Iterable<PostEntity> value):
        _postsState.value = PostsListLoadedState(value);
        _logger.log(LogLevel.info, '${value.length} posts loaded');

      case Failure<Iterable<PostEntity>>(exception: final Exception ex, stackTrace: final StackTrace? st):
        _logger.log(LogLevel.error, 'Failed to get posts', ex, st);
        _postsState.value = PostsListErrorState(Il8n.current.failedToGetPosts);
    }
  }
}
