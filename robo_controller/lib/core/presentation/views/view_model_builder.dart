import 'package:flutter/widgets.dart' hide View;
import 'package:robo_controller/core/presentation/view_models/view_model.dart';
import 'package:robo_controller/core/presentation/views/view_model_holder.dart';

class ViewModelBuilder<TViewModel extends ViewModel> extends StatefulWidget {
  const ViewModelBuilder({required this.create, required this.builder, this.dispose, super.key});

  final TViewModel Function() create;
  final Widget Function(BuildContext context, TViewModel viewModel) builder;
  final void Function(BuildContext context, TViewModel viewModel)? dispose;

  @override
  State<StatefulWidget> createState() => _ViewModelBuilderState<TViewModel>();
}

class _ViewModelBuilderState<TViewModel extends ViewModel> extends State<ViewModelBuilder<TViewModel>> {
  TViewModel? _currentViewModel;

  TViewModel get _viewModel {
    if (_currentViewModel == null) {
      throw StateError('ViewModel is not initialized');
    }

    // Ignored since the value is guaranteed to be non-null
    // ignore: avoid-non-null-assertion
    return _currentViewModel!;
  }

  @override
  void initState() {
    super.initState();

    _currentViewModel = widget.create();
  }

  @override
  void dispose() {
    widget.dispose?.call(context, _viewModel);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _viewModel,
      builder: (BuildContext context, Widget? child) {
        return ViewModelHolder<TViewModel>(
          viewModel: _viewModel,
          child: widget.builder(context, _viewModel),
        );
      },
    );
  }
}
