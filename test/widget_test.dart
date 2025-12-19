import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:zrc/core/router/app_router.dart';
import 'package:zrc/zrc_app.dart';

class MockThemeCubit extends Cubit<ThemeMode> {
  MockThemeCubit() : super(ThemeMode.light);
}

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  // HydratedStorage وهمي للاختبارات
  final tempDir = Directory.systemTemp.createTempSync();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: HydratedStorageDirectory(tempDir.path),
  );

  testWidgets('Counter increments smoke test', (final tester) async {
    // Inject MockThemeCubit
    await tester.pumpWidget(
      BlocProvider<MockThemeCubit>(
        create: (_) => MockThemeCubit(),
        child: ZrcApp(appRouter: AppRouter()),
      ),
    );

    // Verify counter starts at 0
    expect(find.text('0'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('1'), findsOneWidget);
  });
}
