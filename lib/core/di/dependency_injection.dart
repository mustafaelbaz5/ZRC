import 'package:get_it/get_it.dart';
import 'package:zrc/core/auth/data/repo/auth_repo.dart';
import 'package:zrc/core/auth/data/repo/auth_repo_impl.dart';
import 'package:zrc/core/auth/data/service/auth_service.dart';
import 'package:zrc/core/auth/logic/cubit/auth_cubit.dart';
import 'package:zrc/core/service/course_service.dart';
import 'package:zrc/core/storage/secure_storage.dart';
import 'package:zrc/modules/instructor/features/courses/data/repo/instructor_courses_repo.dart';
import 'package:zrc/modules/instructor/features/courses/data/repo/instructor_courses_repo_impl.dart';
import 'package:zrc/modules/instructor/features/courses/logic/cubit/instructor_courses_cubit.dart';

final GetIt getIt = GetIt.instance;

Future<void> setUpDependencies() async {
  // Secure Storage
  getIt.registerLazySingleton<SecureStorage>(() => SecureStorage());

  // Auth Dependencies Injection
  getIt.registerLazySingleton<AuthService>(() => AuthService());
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(
      authService: getIt<AuthService>(),
      secureStorage: getIt<SecureStorage>(),
    ),
  );
  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt<AuthRepo>()));

  // Courses Dependencies Injection
  getIt.registerLazySingleton<CourseService>(() => CourseService());
  getIt.registerLazySingleton<InstructorCoursesRepo>(
    () => InstructorCoursesRepoImpl(
      courseService: getIt<CourseService>(),
      authRepo: getIt<AuthRepo>(),
    ),
  );
  getIt.registerLazySingleton<InstructorCoursesCubit>(
    () => InstructorCoursesCubit(repo: getIt<InstructorCoursesRepo>()),
  );
}
