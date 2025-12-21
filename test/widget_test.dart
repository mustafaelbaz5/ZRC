import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:zrc/core/di/dependency_injection.dart';
import 'package:zrc/core/router/app_router.dart';
import 'package:zrc/zrc_app.dart';

class MockPathProviderPlatform extends PathProviderPlatform {
  @override
  Future<String?> getTemporaryPath() async {
    final tempDir = Directory.systemTemp.createTempSync('zrc_test_');
    return tempDir.path;
  }
}

void main() {
  // 1. Ensure bindings and translations are ready
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    PathProviderPlatform.instance = MockPathProviderPlatform();

    // Initialize Hydrated Storage
    final tempDir = Directory.systemTemp.createTempSync('hydrated_test_');
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: HydratedStorageDirectory(tempDir.path),
    );

    // 2. Initialize Dependency Injection (GetIt)
    await setupGetIt();

    // 3. Initialize EasyLocalization for tests
    await EasyLocalization.ensureInitialized();
  });

  tearDownAll(() async {
    await HydratedBloc.storage.clear();
  });

  // Helper function to wrap ZrcApp with necessary providers
  Widget createTestWidget() {
    return EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations', // Ensure this path matches your pubspec.yaml
      startLocale: const Locale('en'),
      child: ScreenUtilInit(
        designSize: const Size(360, 690), // Match your main design size
        builder: (_, final _) => ZrcApp(appRouter: AppRouter()),
      ),
    );
  }

  testWidgets('ZrcApp loads successfully', (final WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget());

    // Important: With EasyLocalization, you often need to pump more than once
    await tester.pump();
    await tester.pumpAndSettle();

    expect(find.byType(MaterialApp), findsOneWidget);
  });

  testWidgets('Navigation router is initialized', (
    final WidgetTester tester,
  ) async {
    await tester.pumpWidget(createTestWidget());
    await tester.pumpAndSettle();

    final appRouter = find.byType(ZrcApp);
    expect(appRouter, findsOneWidget);
  });
}
