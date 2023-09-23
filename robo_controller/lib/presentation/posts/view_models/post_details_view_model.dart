import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:robo_controller/core/presentation/view_models/view_model.dart';
import 'package:robo_controller/core/reflection.dart';
import 'package:robo_controller/domain/posts/models/post_entity.dart';

@injectable
@navigatable
class PostDetailsViewModel extends ViewModel {
  @postParam
  PostEntity post = PostEntity.empty;
}

const QueryParam postParam = QueryParam('post');
