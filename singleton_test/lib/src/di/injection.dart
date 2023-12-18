import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:singleton_test/src/constants/build_env.dart';

import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
    // initializerName: 'init', // default
    // preferRelativeImports: true, // default
    // asExtension: true, // default
    )
void configureDependencies() => getIt.init(environment: BuildEnv.currentEnv);
