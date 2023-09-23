import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:robo_controller/core/service_locator.config.dart';

const Named appServerUrl = Named('apiBaseUrl');

@InjectableInit(
  initializerName: r'$register',
  preferRelativeImports: false,
  asExtension: false,
)
abstract class ServiceLocator {
  static GetIt get instance {
    if (_instance == null) {
      throw UnsupportedError(
        'GetIt is not initialized, did you forget to call DependencyInjection.registerDependencies()?',
      );
    }

    // We already checked for null above
    // ignore: avoid-non-null-assertion
    return _instance!;
  }

  static GetIt? _instance;

  static void registerDependencies() {
    final GetIt getIt = GetIt.instance..allowReassignment = true;
    _instance = $register(getIt);
  }
}
