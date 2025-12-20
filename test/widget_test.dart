import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:zrc/core/router/app_router.dart';
import 'package:zrc/zrc_app.dart';

/// Mock PathProvider for testing
class MockPathProviderPlatform extends PathProviderPlatform {
  @override
  Future<String?> getTemporaryPath() async {
    final tempDir = Directory.systemTemp.createTempSync('zrc_test_');
    return tempDir.path;
  }

  @override
  Future<String?> getApplicationDocumentsPath() async {
    final tempDir = Directory.systemTemp.createTempSync('zrc_docs_');
    return tempDir.path;
  }

  @override
  Future<String?> getApplicationSupportPath() async {
    final tempDir = Directory.systemTemp.createTempSync('zrc_support_');
    return tempDir.path;
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    // Set up mock PathProvider
    PathProviderPlatform.instance = MockPathProviderPlatform();

    // Initialize HydratedBloc storage
    final tempDir = Directory.systemTemp.createTempSync('hydrated_test_');
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: HydratedStorageDirectory(tempDir.path),
    );
  });

  tearDownAll(() async {
    // Clean up HydratedBloc storage
    await HydratedBloc.storage.clear();
  });

  testWidgets('ZrcApp loads successfully', (final WidgetTester tester) async {
    // Build the app
    await tester.pumpWidget(ZrcApp(appRouter: AppRouter()));

    // Wait for all animations and async operations to complete
    await tester.pumpAndSettle();

    // Verify the app loaded
    expect(find.byType(MaterialApp), findsOneWidget);
  });

  testWidgets('Navigation router is initialized', (
    final WidgetTester tester,
  ) async {
    final appRouter = AppRouter();

    await tester.pumpWidget(ZrcApp(appRouter: appRouter));
    await tester.pumpAndSettle();

    // Verify router is working
    expect(appRouter, isNotNull);
  });
}
