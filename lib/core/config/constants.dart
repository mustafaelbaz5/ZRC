import 'package:flutter/material.dart';

class Constants {
  const Constants._();

  static const String supabaseUrl = 'https://xazxnrhoqhsvhyazselc.supabase.co';
  static const String supabaseAnonKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhhenhucmhvcWhzdmh5YXpzZWxjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjM2NTQ5MzgsImV4cCI6MjA3OTIzMDkzOH0.qv9C21pbuhVAu1MR6TC1Q355MG9BU74PUWn2aI9URpE';

  static const String userStorageKey = 'user_storage_key';
  static const String profileImagePath = 'profile_image_path';
  static final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>();
}
