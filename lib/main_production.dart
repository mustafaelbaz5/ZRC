import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/di/dependency_injection.dart';
import 'core/router/app_router.dart';
import 'firebase_options.dart';
import 'zrc_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://xazxnrhoqhsvhyazselc.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhhenhucmhvcWhzdmh5YXpzZWxjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjM2NTQ5MzgsImV4cCI6MjA3OTIzMDkzOH0.qv9C21pbuhVAu1MR6TC1Q355MG9BU74PUWn2aI9URpE',
  );
  setupGetIt();
  await ScreenUtil.ensureScreenSize();
  runApp(ZrcApp(appRouter: AppRouter()));
}
// flutter run --release --flavor production --target lib/main_production.dart