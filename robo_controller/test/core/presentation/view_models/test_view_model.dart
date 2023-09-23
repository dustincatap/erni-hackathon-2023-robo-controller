import 'package:robo_controller/core/presentation/view_models/view_model.dart';

class TestViewModel extends ViewModel {
  bool isDisposed = false;

  @override
  void dispose() {
    isDisposed = true;
    super.dispose();
  }
}
