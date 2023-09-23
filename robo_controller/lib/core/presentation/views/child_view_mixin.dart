import 'package:flutter/widgets.dart' hide View;
import 'package:robo_controller/core/presentation/view_models/view_model.dart';
import 'package:robo_controller/core/presentation/views/view.dart';
import 'package:robo_controller/core/presentation/views/view_extensions.dart';
import 'package:robo_controller/core/presentation/views/view_model_builder.dart';

mixin ChildViewMixin<TViewModel extends ViewModel> implements View<TViewModel> {
  @mustCallSuper
  Widget build(BuildContext context) {
    return ViewModelBuilder<TViewModel>(
      create: () => onCreateViewModel(context),
      builder: buildView,
      dispose: onDisposeViewModel,
    );
  }

  @protected
  @override
  @mustCallSuper
  TViewModel onCreateViewModel(BuildContext context) => context.viewModel<TViewModel>();

  @protected
  @override
  // Ignored because of satisfying an interface contract
  // ignore: no-empty-block
  void onDisposeViewModel(BuildContext context, TViewModel viewModel) {}
}
