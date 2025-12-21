import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:zrc/core/router/app_router.dart';
import 'package:zrc/zrc_app.dart';

class MockPathProviderPlatform extends PathProviderPlatform {
  @override
  Future<String> getTemporaryPath() async {
    return Directory.systemTemp.createTempSync('zrc_temp_').path;
  }

  @override
  Future<String> getApplicationDocumentsPath() async {
    return Directory.systemTemp.createTempSync('zrc_docs_').path;
  }

  @override
  Future<String> getApplicationSupportPath() async {
    return Directory.systemTemp.createTempSync('zrc_support_').path;
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory hydratedDir;

  setUpAll(() async {
    PathProviderPlatform.instance = MockPathProviderPlatform();

    // Create temp directory for HydratedBloc
    hydratedDir = Directory.systemTemp.createTempSync('hydrated_bloc_test_');

    // Initialize HydratedBloc storage
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: HydratedStorageDirectory(hydratedDir.path),
    );
  });

  tearDownAll(() async {
    await HydratedBloc.storage.clear();
    await hydratedDir.delete(recursive: true);
  });

  testWidgets('ZrcApp builds successfully', (final tester) async {
    await tester.pumpWidget(ZrcApp(appRouter: AppRouter()));

    await tester.pumpAndSettle();

    expect(find.byType(MaterialApp), findsOneWidget);
  });

  testWidgets('AppRouter is initialized correctly', (final tester) async {
    final appRouter = AppRouter();

    await tester.pumpWidget(ZrcApp(appRouter: appRouter));

    await tester.pumpAndSettle();

    expect(appRouter, isNotNull);
  });
}
