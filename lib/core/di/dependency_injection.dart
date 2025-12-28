import 'package:get_it/get_it.dart';
import 'package:zrc/core/auth/data/repo/auth_repo.dart';
import 'package:zrc/core/auth/data/repo/auth_repo_impl.dart';
import 'package:zrc/core/auth/data/service/auth_service.dart';
import 'package:zrc/core/auth/logic/cubit/auth_cubit.dart';
import 'package:zrc/core/storage/secure_storage.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Core dependencies

  // Secure Storage - Lazy singleton (created only when first used)
  getIt.registerLazySingleton<SecureStorage>(() => SecureStorage());

  // Services - Pure logic, no state → singleton
  getIt.registerLazySingleton<AuthService>(() => AuthService());

  // Repository - Inject dependencies, singleton because stateless
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(
      authService: getIt<AuthService>(),
      secureStorage: getIt<SecureStorage>(),
    ),
  );

  // Cubit - Has state → must be factory (new instance each time)
  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt<AuthRepo>()));
}
