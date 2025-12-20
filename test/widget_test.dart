import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:zrc/core/router/app_router.dart';
import 'package:zrc/zrc_app.dart';

/// PathProvider وهمي للاختبارات
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

  // استخدم PathProvider وهمي
  PathProviderPlatform.instance = TestPathProviderPlatform();

  // HydratedBloc storage وهمي
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(Directory.systemTemp.path),
  );

  testWidgets('Counter increments smoke test', (final tester) async {
    // شغّل التطبيق
    await tester.pumpWidget(ZrcApp(appRouter: AppRouter()));

    // تحقق أن العداد يبدأ من 0
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // اضغط على أيقونة "+"
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // تحقق أن العداد تم زيادته
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
