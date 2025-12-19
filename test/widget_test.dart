import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:zrc/core/router/app_router.dart';
import 'package:zrc/zrc_app.dart';

class TestPathProviderPlatform extends PathProviderPlatform {
  @override
  Future<String?> getTemporaryPath() async {
    final tempDir = Directory.systemTemp.createTempSync();
    return tempDir.path;
  }

  @override
  Future<String?> getApplicationDocumentsPath() async {
    final tempDir = Directory.systemTemp.createTempSync();
    return tempDir.path;
  }
}

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  // استخدم path provider وهمي للاختبارات
  PathProviderPlatform.instance = TestPathProviderPlatform();

  // HydratedBloc storage وهمي مؤقت
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(
      (await getTemporaryDirectory()).path,
    ),
  );

  // لو مش محتاجين Firebase أو Supabase حقيقية في الاختبارات، نقدر نتجاوزها أو نعمل Mock
  // await Firebase.initializeApp();
  // await Supabase.initialize(url: 'dummy', anonKey: 'dummy');

  testWidgets('Counter increments smoke test', (
    final WidgetTester tester,
  ) async {
    await tester.pumpWidget(ZrcApp(appRouter: AppRouter()));

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
