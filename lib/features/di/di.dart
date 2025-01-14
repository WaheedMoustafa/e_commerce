import 'package:e_commerce/features/di/di.config.dart';
import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName : 'init' ,
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies() => getIt.init();